USB Webcam
======

## Raspberry surveillance system

This is a repository showing how you use a Raspberry Pi and a Webcam to capture images and store them on a server.
The Cam can be your "good old" retired USB WebCam or the Raspberry Cam.

1. Download the [quick start guide](http://www.raspberrypi.org/wp-content/uploads/2012/04/quick-start-guide-v2_1.pdf)
2. Download [NOOBS v1.3.2](http://www.raspberrypi.org/downloads) and unzip it onto the empty FAT formatted SD card.
3. Install SD card, connect keyboard, mouse, monitor and network cable,and [Raspberry Cam](http://www.farnell.com/datasheets/1730389.pdf)
For you own sake use the HDMI output, and things don't get to crammed on the screen.
4. Power up, and select "Raspbian", and install (i), and answer "yes" to the questions.
This takes quite a bit of time ( 0.5 - 0.9 Mb/sec)
When the install is ready, the card reboots.
5. In setup: Expand filesystem
6. In setup: Enable camera if you use a Raspberry Cam.
7. Reboot your Raspberry card
8. Look at the boot screen to see your IP address
9. Login at pi@xx.xx.xx.xx using password raspberry
10. Connect your USB camera, and use "lsusb" to see that it is connected, and "lsusb -v" for details.
11. Or use "raspistill -v -o test.jpg" to capture a image from the internal cam.
12. "sudo passwd root" to get access rights.
13. "sudo apt-get install streamer" to get recording/capture SW for USB Web Cam
14. "wget https://raw2.github.com/sunejak/Webcam/master/webcam_capture.sh" to get the USB camera capture file
16. "wget https://raw2.github.com/sunejak/Webcam/master/crontab.file" to get the crontab entry for capture every minute
17. "chmod +rx capture.sh" to set the execute mode on the capture file.
18. Generate keypair
"ssh-keygen -t rsa"

    Generating public/private rsa key pair.

    Enter file in which to save the key (/home/pi/.ssh/id_rsa): 

    Enter passphrase (empty for no passphrase): 

    Enter same passphrase again: 

    Your identification has been saved in /home/pi/.ssh/id_rsa.

    Your public key has been saved in /home/pi/.ssh/id_rsa.pub.

    The key fingerprint is:

    f1:7d:46:a5:96:66:90:7c:7f:9c:a1:48:a4:a3:14:cf pi@raspberry

    The key's randomart image is:

    +--[ RSA 2048]----+

    |          .o...oo|

    |       .  ..+ o.o|

    |       . E o o  .|

    |      . S o . o  |

    |       .     o   |
:
    +-----------------+

19. Add the certificate to your server "cat .ssh/id_rsa.pub | ssh user@your.server.org 'cat >> .ssh/authorized_keys'" to put RSA key on your server

20. Tweek with camera and script parameters, edit to suit your needs.
21. Add "crontab crontab.file" to take pictures every minute.
22. Enjoy :)

