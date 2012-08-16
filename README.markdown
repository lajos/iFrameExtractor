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

##### configure #####

>./configure \

>--cc=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc \

>--as='/usr/local/bin/gas-preprocessor.pl /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc' \

>--sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.1.sdk \

>--target-os=darwin \

>--arch=arm \

>--cpu=cortex-a8 \

>--extra-cflags='-arch armv7' \

>--extra-ldflags='-arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.1.sdk' \

>--prefix=compiled/armv7 \

>--enable-cross-compile \

>--enable-nonfree \

>--enable-gpl \

>--disable-armv5te \

>--disable-swscale-alpha \

>--disable-doc \

>--disable-ffmpeg \

>--disable-ffplay \

>--disable-ffprobe \

>--disable-ffserver \

>--disable-asm \

>--disable-debug

##### make #####

>make clean

>make && make install

- `armv6` (for devices before 3GS)

##### configure #####

>./configure \

>--cc=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc \

>--as='/usr/local/bin/gas-preprocessor.pl /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc' \

>--sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.1.sdk \

>--target-os=darwin \

>--arch=arm \

>--cpu=arm1176jzf-s \

>--extra-cflags='-arch armv6' \

>--extra-ldflags='-arch armv6 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.1.sdk' \

>--prefix=compiled/armv6 \

>--enable-cross-compile \

>--enable-nonfree \

>--enable-gpl \

>--disable-armv5te \

>--disable-swscale-alpha \

>--disable-doc \

>--disable-ffmpeg \

>--disable-ffplay \

>--disable-ffprobe \

>--disable-ffserver \

>--disable-asm \

>--disable-debug

##### make #####

>make clean

>make && make install

- `i386` (for simulator)

##### configure #####

>./configure \

>--cc=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/gcc \

>--as='/usr/local/bin/gas-preprocessor.pl /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/gcc' \

>--sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator5.1.sdk \

>--target-os=darwin \

>--arch=i386 \

>--cpu=i386 \

>--extra-cflags='-arch i386' \

>--extra-ldflags='-arch i386 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator5.1.sdk' \

>--prefix=compiled/i386 \

>--enable-cross-compile \

>--enable-nonfree \

>--enable-gpl \

>--disable-armv5te \

>--disable-swscale-alpha \

>--disable-doc \

>--disable-ffmpeg \

>--disable-ffplay \

>--disable-ffprobe \

>--disable-ffserver \

>--disable-asm \

>--disable-debug

##### make #####

>make clean

>make && make install

- `universal` (using one *.a files for all platforms)

>mkdir -p ./compiled/fat/lib

>lipo -output ./compiled/fat/lib/libavcodec.a  -create \

>-arch armv6 ./compiled/armv6/lib/libavcodec.a \

>-arch armv7 ./compiled/armv7/lib/libavcodec.a \

>-arch i386 ./compiled/i386/lib/libavcodec.a


>lipo -output ./compiled/fat/lib/libavdevice.a  -create \

>-arch armv6 ./compiled/armv6/lib/libavdevice.a \

>-arch armv7 ./compiled/armv7/lib/libavdevice.a \

>-arch i386 ./compiled/i386/lib/libavdevice.a

>lipo -output ./compiled/fat/lib/libavformat.a  -create \

>-arch armv6 ./compiled/armv6/lib/libavformat.a \

>-arch armv7 ./compiled/armv7/lib/libavformat.a \

>-arch i386 ./compiled/i386/lib/libavformat.a


>lipo -output ./compiled/fat/lib/libavutil.a  -create \

>-arch armv6 ./compiled/armv6/lib/libavutil.a \

>-arch armv7 ./compiled/armv7/lib/libavutil.a \

>-arch i386 ./compiled/i386/lib/libavutil.a


>lipo -output ./compiled/fat/lib/libswresample.a  -create \

>-arch armv6 ./compiled/armv6/lib/libswresample.a \

>-arch armv7 ./compiled/armv7/lib/libswresample.a \

>-arch i386 ./compiled/i386/lib/libswresample.a


>lipo -output ./compiled/fat/lib/libpostproc.a  -create \

>-arch armv6 ./compiled/armv6/lib/libpostproc.a \

>-arch armv7 ./compiled/armv7/lib/libpostproc.a \

>-arch i386 ./compiled/i386/lib/libpostproc.a


>lipo -output ./compiled/fat/lib/libswscale.a  -create \

>-arch armv6 ./compiled/armv6/lib/libswscale.a \

>-arch armv7 ./compiled/armv7/lib/libswscale.a \

>-arch i386 ./compiled/i386/lib/libswscale.a


>lipo -output ./compiled/fat/lib/libavfilter.a  -create \

>-arch armv6 ./compiled/armv6/lib/libavfilter.a \

>-arch armv7 ./compiled/armv7/lib/libavfilter.a \

>-arch i386 ./compiled/i386/lib/libavfilter.a

#### The complied static libraries (*.a) lie in the`ffmpeg/compiled` folder. ####