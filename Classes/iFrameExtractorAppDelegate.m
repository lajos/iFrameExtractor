//
//  iFrameExtractorAppDelegate.m
//  iFrameExtractor
//
//  Created by lajos on 1/8/10.
//
//  Copyright 2010 Lajos Kamocsay
//
//  lajos at codza dot com
//
//  iFrameExtractor is free software; you can redistribute it and/or
//  modify it under the terms of the GNU Lesser General Public
//  License as published by the Free Software Foundation; either
//  version 2.1 of the License, or (at your option) any later version.
// 
//  iFrameExtractor is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//  Lesser General Public License for more details.
//

#import "iFrameExtractorAppDelegate.h"
#import "VideoFrameExtractor.h"
#import "Utilities.h"

@implementation iFrameExtractorAppDelegate

@synthesize window, imageView, label, playButton, video;

- (void)dealloc {
	[video release];
	[imageView release];
	[label release];
	[playButton release];
    [window release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	self.video = [[VideoFrameExtractor alloc] initWithVideo:[Utilities bundlePath:@"sophie.mov"]];
	[video release];

	// set output image size
	video.outputWidth = 426;
	video.outputHeight = 320;
	
	// print some info about the video
	NSLog(@"video duration: %f",video.duration);
	NSLog(@"video size: %d x %d", video.sourceWidth, video.sourceHeight);
	
	// video images are landscape, so rotate image view 90 degrees
	[imageView setTransform:CGAffineTransformMakeRotation(M_PI/2)];
    [window makeKeyAndVisible];
}

-(IBAction)playButtonAction:(id)sender {
	[playButton setEnabled:NO];
	lastFrameTime = -1;
	
	// seek to 0.0 seconds
	[video seekTime:0.0];

	[NSTimer scheduledTimerWithTimeInterval:1.0/30
									 target:self
								   selector:@selector(displayNextFrame:)
								   userInfo:nil
									repeats:YES];
}

#define LERP(A,B,C) ((A)*(1.0-C)+(B)*C)

-(void)displayNextFrame:(NSTimer *)timer {
	NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];
	if (![video stepFrame]) {
		[timer invalidate];
		[playButton setEnabled:YES];
		return;
	}
	imageView.image = video.currentImage;
	float frameTime = 1.0/([NSDate timeIntervalSinceReferenceDate]-startTime);
	if (lastFrameTime<0) {
		lastFrameTime = frameTime;
	} else {
		lastFrameTime = LERP(frameTime, lastFrameTime, 0.8);
	}
	[label setText:[NSString stringWithFormat:@"%.0f",lastFrameTime]];
}

@end
