<#
.SYNOPSIS
    Generates 150x150 center-cropped JPEG thumbnails for blog roll images.

.DESCRIPTION
    Scans docs/assets/images/featured/ for JPG/PNG files, center-crops them
    to a square, resizes to 150x150, and saves as JPEG in a thumbnails/ subdirectory.
    Skips thumbnails that are already up-to-date.

.EXAMPLE
    Run from the repository root:
    powershell -File scripts/generate-thumbnails.ps1
#>

Add-Type -AssemblyName System.Drawing

$FeaturedDir = Join-Path $PSScriptRoot "..\docs\assets\images\featured"
$ThumbnailDir = Join-Path $FeaturedDir "thumbnails"
$ThumbSize = 150
$JpegQuality = 85

# Ensure thumbnail directory exists
if (-not (Test-Path $ThumbnailDir)) {
    New-Item -ItemType Directory -Path $ThumbnailDir -Force | Out-Null
}

# Get JPEG encoder and set quality
$jpegCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() |
    Where-Object { $_.MimeType -eq "image/jpeg" }
$encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
$encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter(
    [System.Drawing.Imaging.Encoder]::Quality, [long]$JpegQuality
)

# Find source images (not in thumbnails subdirectory)
$extensions = @("*.jpg", "*.jpeg", "*.png")
$sourceImages = @()
foreach ($ext in $extensions) {
    $sourceImages += Get-ChildItem -Path $FeaturedDir -Filter $ext -File
}

if ($sourceImages.Count -eq 0) {
    Write-Host "No images found in $FeaturedDir"
    exit 0
}

$generated = 0
$skipped = 0

foreach ($source in $sourceImages | Sort-Object Name) {
    $stem = [System.IO.Path]::GetFileNameWithoutExtension($source.Name)
    $outputName = "${stem}-thumb.jpg"
    $outputPath = Join-Path $ThumbnailDir $outputName

    # Skip if thumbnail exists and is newer than source
    if (Test-Path $outputPath) {
        $thumbTime = (Get-Item $outputPath).LastWriteTime
        if ($thumbTime -ge $source.LastWriteTime) {
            Write-Host "  SKIP (up to date): $outputName"
            $skipped++
            continue
        }
    }

    Write-Host "  GENERATE: $($source.Name) -> thumbnails/$outputName"

    try {
        $img = [System.Drawing.Image]::FromFile($source.FullName)

        # Center crop to square
        $side = [Math]::Min($img.Width, $img.Height)
        $left = [int](($img.Width - $side) / 2)
        $top = [int](($img.Height - $side) / 2)
        $cropRect = New-Object System.Drawing.Rectangle($left, $top, $side, $side)

        # Create cropped bitmap
        $cropped = New-Object System.Drawing.Bitmap($side, $side)
        $graphics = [System.Drawing.Graphics]::FromImage($cropped)
        $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics.DrawImage($img, (New-Object System.Drawing.Rectangle(0, 0, $side, $side)), $cropRect, [System.Drawing.GraphicsUnit]::Pixel)
        $graphics.Dispose()
        $img.Dispose()

        # Resize to thumbnail size
        $thumb = New-Object System.Drawing.Bitmap($ThumbSize, $ThumbSize)
        $graphics2 = [System.Drawing.Graphics]::FromImage($thumb)
        $graphics2.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics2.DrawImage($cropped, 0, 0, $ThumbSize, $ThumbSize)
        $graphics2.Dispose()
        $cropped.Dispose()

        # Save as JPEG
        $thumb.Save($outputPath, $jpegCodec, $encoderParams)
        $thumb.Dispose()

        $generated++
    }
    catch {
        Write-Host "  ERROR processing $($source.Name): $_" -ForegroundColor Red
    }
}

Write-Host "`nDone. Generated: $generated, Skipped: $skipped, Total sources: $($sourceImages.Count)"
