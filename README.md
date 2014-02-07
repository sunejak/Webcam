Webcam
======

## Raspberry surveillance system

This is a repository showing how you use a Raspberry Pi and a Webcam to capture images and store them on a server.

1. Download the [quick start guide](http://www.raspberrypi.org/wp-content/uploads/2012/04/quick-start-guide-v2_1.pdf)
2. Download [NOOBS v1.3.2](http://www.raspberrypi.org/downloads) and unzip it onto the empty FAT formatted SD card.
3. Install SD card, connect keyboard, mouse, monitor and network cable.
For you own sake use the HDMI output, and thing don't get to crammed on the screen.
4. Power up, and select "Raspbian", and install (i), and answer "yes" to the questions.
This takes quite a bit of time ( 0.5 - 0.9 Mb/sec)
When the install is ready, the card reboots.
5. In setup: Expand filesystem
6. In setup: Enable camera if you use a Raspberry onboard camera
7. Reboot your Raspberry card
8. Look at the boot screen to see your IP address
9. Login at pi@xx.xx.xx.xx using password raspberry
10. Connect your camera, and use "lsusb" to see that it is connected, and "lsusb -v" for details.
11. "su passwd root" to get access rights.
12. "sudo apt-get install streamer" to get recording/capture SW



