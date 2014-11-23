//
//  RGViewController.m
//  Animator
//
//  Created by ROBERA GELETA on 11/22/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "RGViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface RGViewController ()
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIView *leftView;

@end

@implementation RGViewController
{
    CATransform3D transformer;
    BOOL movingRight;
    CATransform3D rightRotator;
}

- (IBAction)pan:(UIPanGestureRecognizer *)sender
{
    UIPanGestureRecognizer *panner = (UIPanGestureRecognizer *)sender;
    CGPoint movement = [panner translationInView:self.view];
    if(panner.state == UIGestureRecognizerStateBegan)
    {
        transformer = CATransform3DIdentity;
        movingRight = YES;
        rightRotator = CATransform3DIdentity;
        rightRotator.m34 = 1.0/-500;
        //------- add if you only want to move right
//        if(movement.x > 0)
//        {
//            movingRight = YES;
//            transformer = CATransform3DIdentity;
//        }
//        else
//        {
//            movingRight = NO;
//        }
    }
    else if(panner.state == UIGestureRecognizerStateChanged)
    {
        if(movingRight)
        {
            CGFloat movementX = movement.x;
            NSLog(@"Fractoin: %f",movementX);
            CATransform3D translationTransform =  CATransform3DTranslate(transformer, movementX,0,0);
            
            CATransform3D rotationTransform = CATransform3DIdentity;
            CGFloat angle = [self angleFromDistance:movementX right:YES];
            CATransform3D rotated =  CATransform3DRotate(rotationTransform, angle, 0, 1, 0);
            
            CATransform3D rotatedAndTranslated = CATransform3DConcat(rotated,translationTransform);
            transformer.m34 = 1.0/-500;
//            self.leftView.layer.transform =  translationTransform;
            self.rightView.layer.transform = rotatedAndTranslated;
            
            
            //translation
//            CATransform3DTranslate(transformer, movementX,0,0);
//            CGFloat angle = [self angleFromDistance:movementX right:YES];
//            NSLog(@"Angle: %f ",angle);
//            CATransform3DRotate(transformer, angle, 0, 1, 0);
//            self.rightView.layer.transform =  CATransform3DRotate(transformer, angle, 0, 1, 0);;
          
//            self.rightView.layer.transform = CATransform3DRotate(rightRotator, angle, 0, 1, 0);
        }
        
    }
    else if(panner.state == UIGestureRecognizerStateEnded)
    {
        self.leftView.layer.transform = CATransform3DIdentity;
        self.rightView.layer.transform = CATransform3DIdentity;
        
    }
    
}

- (CGFloat)angleFromDistance:(CGFloat )distance right:(BOOL)right
{
    
    if(right)
    {
        return (distance / self.view.frame.size.width) * .78 * (-1);
    }
    else
    {
        
    }
    CGFloat angle;
    return angle;
}

- (CGFloat)translationFromDistance:(CGFloat)distance
{
    return 1.0f;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    transformer = CATransform3DIdentity;
    transformer.m34 =  1.0/-500;
    
    //setting up the inital transform for the left View
    CATransform3D initalTransformFromLeft =  CATransform3DIdentity;
    CATransform3DRotate(initalTransformFromLeft, .78, 0, 1, 0);
    self.leftView.layer.transform = initalTransformFromLeft ;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    
    
}

@end
