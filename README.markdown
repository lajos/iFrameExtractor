
**original copyright**
>This project extracts frames from video recorded by iPhone 3Gs 
using the LGPL FFmpeg libraries.

>This software is licensed under the GNU-LGPL version 2.1 or later.

>Copyright 2010 Lajos Kamocsay

>lajos at codza dot com

## Introduction ##

This project is forked from <https://github.com/lajos/iFrameExtractor>.
I update the code for the latest ffmpeg and iOS version. The source code is tested on `Mac OS 10.7.4(Lion)` for `ffmpeg 0.11.1` and `iOS 5.1` with `Xcode 4.3.2`.

## Build tips ##

- Download the code using

`git clone git://github.com/PinkyJie/iFrameExtractor.git`

- Download the latest ffmpeg (0.11.1 tested) using

`git clone git://source.ffmpeg.org/ffmpeg.git`

- Put the ffmpeg source code into the folder `ffmpeg`

- Read the compile scripts is in the `ffmpeg/how_to_build` file, select your target platform (i386 or armv6 or armv7) and follow
the corresponding script

- The generated static library files(*.a) lie in the folder `compiled`