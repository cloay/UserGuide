//
//  GuideView.m
//  lvYe
//
//  Created by Cloay on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GuideView.h"

@implementation GuideView
@synthesize imageView;
@synthesize pageScroll;
@synthesize pageControl;
@synthesize closeButton;
@synthesize startButton;
@synthesize left;
@synthesize right;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self.pageScroll setContentSize:CGSizeMake(1600, 0)];
    [self.pageScroll setDelegate:self];
}
-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{   
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    if ([animationID isEqualToString:@"split"] && finished) {
        [self.left removeFromSuperview];
        [self.right removeFromSuperview];
    }
    [self removeFromSuperview];
}

- (IBAction)startButtonDidPressed:(id)sender{
    [self.startButton setHidden:YES];
    NSArray *array = [UIImage splitImageIntoTwoParts:self.imageView.image];
    self.left = [[UIImageView alloc] initWithImage:[array objectAtIndex:0]];
    [self.left setFrame:CGRectMake(0, 0, 320, 480)];
    self.right = [[UIImageView alloc] initWithImage:[array objectAtIndex:1]];
    [self.right setFrame:CGRectMake(0, 0, 320, 480)];
    
    [self addSubview:self.left];
    [self addSubview:self.right];
    [self.pageScroll setHidden:YES];
    [self.pageControl setHidden:YES];
    self.left.transform = CGAffineTransformIdentity;
    self.right.transform = CGAffineTransformIdentity;
    
    [UIView beginAnimations:@"split" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1.2];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    [self.left setAlpha:0.15];
    [self.right setAlpha:0.15];
    self.left.transform = CGAffineTransformMakeTranslation(-180 ,0);
    self.right.transform = CGAffineTransformMakeTranslation(180 ,0);   
    [UIView commitAnimations];
}

- (IBAction)closeButtonDidPressed:(id)sender{
    [UIView beginAnimations:@"Close" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [self setAlpha:0.15];
    [UIView commitAnimations];
}

#pragma mark -
#pragma mark scrollview delegate method
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = self.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    if (page < 4) {
        [closeButton setHidden:NO];
    }else {
        [closeButton setHidden:YES];
    }
    pageControl.currentPage = page;
}
@end
