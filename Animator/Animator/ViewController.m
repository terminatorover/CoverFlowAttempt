//
//  ViewController.m
//  Animator
//
//  Created by ROBERA GELETA on 11/22/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *door;

@end

@implementation ViewController
{
    CATransform3D combinedTransform;
    BOOL check;
}

- (IBAction)panning:(UIPanGestureRecognizer *)sender
{
    UIPanGestureRecognizer *panning = (UIPanGestureRecognizer *)sender;
    if(panning.state ==  UIGestureRecognizerStateBegan)
    {
        if([panning translationInView:self.view].x < 0)
        {
            check = NO;
        }
        else
        {
            check = YES;
        }
    }
    else if (panning.state == UIGestureRecognizerStateChanged)
    {
        if(check)
        {
            CGPoint moved = [panning translationInView:self.view];
            CGFloat movedX = abs(moved.x);
            CGFloat fraction = -1 *(movedX / self.view.frame.size.width) * .8;
            NSLog(@"%f",fraction);
            self.door.layer.transform = CATransform3DRotate(combinedTransform, fraction, 0, .5, 0);
        }
        else
        {
            
        }
    }
    else if(panning.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:1
                              delay:.1
             usingSpringWithDamping:3
              initialSpringVelocity:10
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.door.layer.transform = CATransform3DIdentity;
                             self.door.layer.anchorPoint = CGPointMake(0.5, 0.5);
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    combinedTransform = CATransform3DIdentity;
    combinedTransform.m34 = 1.0/-500;


   }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
