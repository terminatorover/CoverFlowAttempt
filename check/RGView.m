//
//  RGView.m
//  check
//
//  Created by ROBERA GELETA on 11/3/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "RGView.h"

@implementation RGView
{
    UILabel *mainLabel;
    UIImageView *mainImageView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{   self = [super initWithFrame:frame];
    if(!self)
    {
        return  nil;
    }
    
    
    //setting up image View
    mainImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    [self addSubview:mainImageView];
    
    mainLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    mainLabel.backgroundColor = [UIColor redColor];
    
    [self addSubview:mainLabel];
    
    
    [self pinner:mainLabel];
    
    return self;
}



- (void)setText:(NSString *)text
{
    _text = text;
    mainLabel.text = _text;
}

- (void)pinner:(UIView *)view
{
    view.translatesAutoresizingMaskIntoConstraints   = NO;
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                      attribute:NSLayoutAttributeTop
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeTop
                                                                     multiplier:1.0
                                                                       constant:30];
    [self addConstraint:topConstraint];
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                      attribute:NSLayoutAttributeTrailing
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeTrailing
                                                                     multiplier:1.0
                                                                       constant:30];
    [self addConstraint:rightConstraint];
    
    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                       attribute:NSLayoutAttributeLeading
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self
                                                                       attribute:NSLayoutAttributeLeading
                                                                      multiplier:1.0
                                                                        constant:30];
    [self addConstraint:leftConstraint];
    
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeBottom
                                                                    multiplier:1.0
                                                                      constant:30];
    [self addConstraint:bottomConstraint];

    
    
    

    

}
@end
