//
//  iFrameExtractorAppDelegate.h
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

#import <UIKit/UIKit.h>

@class VideoFrameExtractor;

@interface iFrameExtractorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UIImageView *imageView;
	IBOutlet UILabel *label;
	IBOutlet UIButton *playButton;
	VideoFrameExtractor *video;
	float lastFrameTime;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) VideoFrameExtractor *video;

-(IBAction)playButtonAction:(id)sender;
- (IBAction)showTime:(id)sender;

@end

