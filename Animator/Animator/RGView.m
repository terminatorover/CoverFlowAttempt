//
//  RGView.m
//  Animator
//
//  Created by ROBERA GELETA on 11/23/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "RGView.h"

@implementation RGView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    return self;
}


- (void)layoutSubviews
{
    NSLog(@"Frame Is Changing");
}

@end
