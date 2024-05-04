---
layout: post
title:  "A Live Rail Departure Board with Raspberry Pi Pico W and Inky Display"
date:   2024-03-23 07:56:00 +0000
categories: d365 finance alm
tags: Raspberry Pi Pico W Live Rail Train Departure Board Real Time Trains API Pimoroni
---

(IMAGE 1)

## Introduction
This post is about is how I built a live railway departure board using the superb Raspberry Pi Pico, an E-ink display, an AA battery pack, and some micro Python code.

## Hardware Requirements

# Raspberry Pi Pico W

(IMAGE 2)

The Raspberry Pi Pico I used for this project was the Raspeberry Pi Pico W, which is the wireless enabled version of the Pico, with built in 2.4GHz 802.11n WiFi. This means that the Pico can connect to a wireless network, allowing connection to the internet, and therefore APIs to get Live train data.

The Pico I chose was the Raspberry Pi Pico W, and the variation was the WH. The H is important, as this version comes with pre-soldered headers, which can slot straight into the pre-soldered socket headers on the back of the e-ink display (see below). I bought it from The PiHut, for £6.90:

[Raspberry Pi Pico W](https://thepihut.com/products/raspberry-pi-pico-w)

# E-ink Display

(IMAGE)

E-ink displays use the same technology as the display in your Kindle e-reader, and are ultra low power consuming compared to other displays. They take time to refresh, but for static information which refreshes infrequently, like books or departure board projects, they are great. The displays only consume power when they refresh, the image displayed on e-ink is retained even when the device is switched off. This means they are also excellent for small, portable, battery powered projects.

I chose the Pico Inky Pack by Pimoroni which cost £19.80. It has a 2.9 inch display, 3 buttons, and pre-soldered socket headers, so the Pico W with headers slots straight onto the back. I bought it from The PiHut here:

[Pimoroni Pico Inky Pack](https://thepihut.com/products/pico-inky-pack)

# Battery Pack

(IMAGE 4)

During development the Pico and display are powered via the USB port which is connected to my laptop. As this project is low power consuming, I decided to try out running it from a USB battery pack. Not a powerful lithium pack, just a pack you find in your day to day electronics holding three AA disposible batteries. It has a USB connector, so can be connected to the Raspberry Pi Pico, and was £2.20 from PiHut.

[3xAAA USB Battery Holder with Cover and Switch](https://thepihut.com/products/3xaaa-usb-battery-holder-with-cover-and-switch)

# USB Cable

(IMAGE 5)

To connect the Pico to my laptop for coding, then ultimately to the battery pack for portability, I chose a 15cm USB-A to Micro USB 2.0 cable. This was £1.50 from The PiHut:

[USB-A to Micro-USB Cable](https://thepihut.com/products/usb-to-micro-usb-cable-0-5m)



## Software Requirements

The quickest way to get up and running with the Pico is to use MicroPython. I will list out the links to the custom firmware, apps and examples I used, but they are also references in the product details for the Inky display on the PiHut site. [Pimoroni Pico Inky Pack](https://thepihut.com/products/pico-inky-pack).

# Customer Firmware

The custom firmware I used is the pimoroni pico build which has all the drivers built in we need to run MicroPython, connect to wireless, connect to the E-ink screen, and connect to the internet to get the train data. 