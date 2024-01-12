---
layout: post
title:  "Useful Windows Batch File Commands"
date:   2010-07-10 14:54:00 +0000
categories: windows cli
tags: DOS Windows ftp BAT script
---

The following code checks if a directory exists, if not it is created. It then moves a file into that directory.

This is ideal code to run before an ftp script as it will prevent a half written file being transmitted via FTP.

```
@echo off
if not exist "C:\Folder\Destination"
(
md "C:\Folder\Destination"
)
move "C:\Folder\Source\*.*"
"C:\Folder\Destination"
pause
```

The pause command lets you see the results of the script. Remove it if automated on a Windows Scheduled Task.