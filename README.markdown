
**original copyright**
>This project extracts frames from video recorded by iPhone 3Gs 
using the LGPL FFmpeg libraries.

>This software is licensed under the GNU-LGPL version 2.1 or later.

>Copyright 2010 Lajos Kamocsay

>lajos at codza dot com

## Introduction ##

This project is forked from <https://github.com/lajos/iFrameExtractor>.
I update the code for the latest ffmpeg and iOS version. The source code is tested on `Mac OS 10.7.4(Lion)` for `ffmpeg 0.11.1` and `iOS 5.1` with `Xcode 4.3.2`.

## Build steps ##

- Download the code using

`git clone git://github.com/PinkyJie/iFrameExtractor.git`

- Download the latest ffmpeg (0.11.1 tested) using

`git clone git://source.ffmpeg.org/ffmpeg.git`

- Put the ffmpeg source code into the folder `ffmpeg`

- Copy the perl script `gas-preprocessor.pl` into `/usr/local/bin` folder

- Change directory to your `ffmpeg` folder, select your target platform and follow the scripts below

### Platforms ###

- `armv7` (for iPhone 3GS and devices after 3GS)

>./configure \<br>
--cc=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc \<br>
--as='/usr/local/bin/gas-preprocessor.pl /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc' \<br>
--sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.1.sdk \<br>
--target-os=darwin \<br>
--arch=arm \<br>
--cpu=cortex-a8 \<br>
--extra-cflags='-arch armv7' \<br>
--extra-ldflags='-arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.1.sdk' \<br>
--prefix=compiled/armv7 \<br>
--enable-cross-compile \<br>
--enable-nonfree \<br>
--enable-gpl \<br>
--disable-armv5te \<br>
--disable-swscale-alpha \<br>
--disable-doc \<br>
--disable-ffmpeg \<br>
--disable-ffplay \<br>
--disable-ffprobe \<br>
--disable-ffserver \<br>
--disable-asm \<br>
--disable-debug

>make clean

>make && make install

- `armv6` (for devices before 3GS)

>./configure \<br>
--cc=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc \<br>
--as='/usr/local/bin/gas-preprocessor.pl /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc' \<br>
--sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.1.sdk \<br>
--target-os=darwin \<br>
--arch=arm \<br>
--cpu=arm1176jzf-s \<br>
--extra-cflags='-arch armv6' \<br>
--extra-ldflags='-arch armv6 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.1.sdk' \<br>
--prefix=compiled/armv6 \<br>
--enable-cross-compile \<br>
--enable-nonfree \<br>
--enable-gpl \<br>
--disable-armv5te \<br>
--disable-swscale-alpha \<br>
--disable-doc \<br>
--disable-ffmpeg \<br>
--disable-ffplay \<br>
--disable-ffprobe \<br>
--disable-ffserver \<br>
--disable-asm \<br>
--disable-debug

>make clean

>make && make install

- `i386` (for simulator)

>./configure \<br>
--cc=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/gcc \<br>
--as='/usr/local/bin/gas-preprocessor.pl /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/gcc' \<br>
--sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator5.1.sdk \<br>
--target-os=darwin \<br>
--arch=i386 \<br>
--cpu=i386 \<br>
--extra-cflags='-arch i386' \<br>
--extra-ldflags='-arch i386 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator5.1.sdk' \<br>
--prefix=compiled/i386 \<br>
--enable-cross-compile \<br>
--enable-nonfree \<br>
--enable-gpl \<br>
--disable-armv5te \<br>
--disable-swscale-alpha \<br>
--disable-doc \<br>
--disable-ffmpeg \<br>
--disable-ffplay \<br>
--disable-ffprobe \<br>
--disable-ffserver \<br>
--disable-asm \<br>
--disable-debug

>make clean

>make && make install

- `universal` (using one *.a files for all platforms)

>mkdir -p ./compiled/fat/lib

>lipo -output ./compiled/fat/lib/libavcodec.a  -create \<br>
-arch armv6 ./compiled/armv6/lib/libavcodec.a \<br>
-arch armv7 ./compiled/armv7/lib/libavcodec.a \<br>
-arch i386 ./compiled/i386/lib/libavcodec.a

>lipo -output ./compiled/fat/lib/libavdevice.a  -create \<br>
-arch armv6 ./compiled/armv6/lib/libavdevice.a \<br>
-arch armv7 ./compiled/armv7/lib/libavdevice.a \<br>
-arch i386 ./compiled/i386/lib/libavdevice.a

>lipo -output ./compiled/fat/lib/libavformat.a  -create \<br>
-arch armv6 ./compiled/armv6/lib/libavformat.a \<br>
-arch armv7 ./compiled/armv7/lib/libavformat.a \<br>
-arch i386 ./compiled/i386/lib/libavformat.a

>lipo -output ./compiled/fat/lib/libavutil.a  -create \<br>
-arch armv6 ./compiled/armv6/lib/libavutil.a \<br>
-arch armv7 ./compiled/armv7/lib/libavutil.a \<br>
-arch i386 ./compiled/i386/lib/libavutil.a

>lipo -output ./compiled/fat/lib/libswresample.a  -create \<br>
-arch armv6 ./compiled/armv6/lib/libswresample.a \<br>
-arch armv7 ./compiled/armv7/lib/libswresample.a \<br>
-arch i386 ./compiled/i386/lib/libswresample.a

>lipo -output ./compiled/fat/lib/libpostproc.a  -create \<br>
-arch armv6 ./compiled/armv6/lib/libpostproc.a \<br>
-arch armv7 ./compiled/armv7/lib/libpostproc.a \<br>
-arch i386 ./compiled/i386/lib/libpostproc.a

>lipo -output ./compiled/fat/lib/libswscale.a  -create \<br>
-arch armv6 ./compiled/armv6/lib/libswscale.a \<br>
-arch armv7 ./compiled/armv7/lib/libswscale.a \<br>
-arch i386 ./compiled/i386/lib/libswscale.a

>lipo -output ./compiled/fat/lib/libavfilter.a  -create \<br>
-arch armv6 ./compiled/armv6/lib/libavfilter.a \<br>
-arch armv7 ./compiled/armv7/lib/libavfilter.a \<br>
-arch i386 ./compiled/i386/lib/libavfilter.a

#### The complied static libraries (*.a) lie in the`ffmpeg/compiled` folder.