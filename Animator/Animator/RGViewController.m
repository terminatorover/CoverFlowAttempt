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
            CATransform3D translationTransform =  CATransform3DTranslate(transformer, movementX,0,0);
            
            CATransform3D rotationTransform = CATransform3DIdentity;
            CGFloat angleRight = [self angleFromDistance:movementX right:YES];
            CATransform3D rotateRight =  CATransform3DRotate(rotationTransform, angleRight, 0, 1, 0);
            
            CATransform3D rotatedAndTranslatedRight = CATransform3DConcat(rotateRight,translationTransform);
            transformer.m34 = 1.0/-500;
            self.rightView.layer.transform = rotatedAndTranslatedRight;
            
            translationTransform =  CATransform3DTranslate(transformer, movementX,0,0);
            CGFloat angleLeft = [self angleFromDistance:movementX right:NO];
//            NSLog(@"Angle: %f",angleLeft);
            CATransform3D rotateLeft = CATransform3DRotate(CATransform3DIdentity,angleLeft, 0, 1, 0);
            CATransform3D rotatedAndTranslatedLeft = CATransform3DConcat(rotateLeft, translationTransform);
            self.leftView.layer.transform = rotatedAndTranslatedLeft;
            [self.rightView setNeedsDisplay];
            NSLog(@"Frame Right: %@",NSStringFromCGRect(self.rightView.frame));

        }
        
    }
    else if(panner.state == UIGestureRecognizerStateEnded)
    {
        
        [UIView animateWithDuration:1 animations:^{
            self.leftView.layer.transform = CATransform3DIdentity;
            self.rightView.layer.transform = CATransform3DIdentity;
        }];
//        [UIView animateWithDuration:1
//                         animations:^{
//                             if(movement.x > 200)
//                             {
//                                 //
//                            
//                                 //
//                                 NSArray *constraints = [self.leftView constraintsAffectingLayoutForAxis:UILayoutConstraintAxisHorizontal];
//                                 //----
//                                 NSLayoutConstraint *rightRightConstraint = [NSLayoutConstraint constraintWithItem:self.rightView
//                                                                                                         attribute:NSLayoutAttributeLeading
//                                                                                                         relatedBy:NSLayoutRelationEqual toItem:self.view
//                                                                                                         attribute:NSLayoutAttributeLeading multiplier:1
//                                                                                                          constant:600];
//                                 
//                                 
//                                 for (NSLayoutConstraint *aConstraint in constraints)
//                                 {
//                                     if([self firstItem:aConstraint secondItem:rightRightConstraint])
//                                     {
//                                         [self.view removeConstraint:aConstraint];
//                                         [self.view addConstraint:rightRightConstraint];
//                                     }
//                                 }
//                             }
//                             else
//                             {
//                                 self.leftView.layer.transform = CATransform3DIdentity;
//                                 self.rightView.layer.transform = CATransform3DIdentity;
//                             }
//        }];
        

    }
    
}


- (BOOL)firstItem:(NSLayoutConstraint *)firstConstraint
       secondItem:(NSLayoutConstraint *)secondConstraint
{
    if(firstConstraint.firstItem != secondConstraint.firstItem)
    {
        return NO;
    }
    if(firstConstraint.secondItem  != secondConstraint.secondItem)
    {
        return NO;
    }
    if(firstConstraint.firstAttribute != secondConstraint.firstAttribute)
    {
        return NO;
    }
    if(firstConstraint.secondAttribute != secondConstraint.secondAttribute)
    {
        return NO;
    }
        
    return YES;
    
}





- (CGFloat)angleFromDistance:(CGFloat )distance right:(BOOL)right
{
    
    if(right)
    {
        return (distance / self.view.frame.size.width) * 0.1 * (-1);
    }
    else
    {
        return (0.1/300) * distance;
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
    initalTransformFromLeft = CATransform3DRotate(initalTransformFromLeft, .78, 0, 1, 0);
    initalTransformFromLeft.m34 = 1.0/-500;
    self.leftView.layer.transform = initalTransformFromLeft ;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    
    
}

@end
