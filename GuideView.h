//
//  GuideView.h
//  lvYe
//
//  Created by Cloay on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+SplitImageIntoTwoParts.h"

@interface GuideView : UIView<UIScrollViewDelegate>
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,strong) UIImageView *left;
@property (nonatomic,strong) UIImageView *right;

@property (retain, nonatomic) IBOutlet UIScrollView *pageScroll;
@property (retain, nonatomic) IBOutlet UIPageControl *pageControl;
@property (retain, nonatomic) IBOutlet UIButton *closeButton;

@property (retain, nonatomic) IBOutlet UIButton *startButton;
- (IBAction)startButtonDidPressed:(id)sender;
- (IBAction)closeButtonDidPressed:(id)sender;
@end
