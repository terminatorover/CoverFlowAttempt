//
//  TransformView.m
//  check
//
//  Created by ROBERA GELETA on 11/23/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "TransformView.h"

@implementation TransformView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)setState:(VIEW_STATE_POSITION)state
{
    CGFloat angle;
    switch (state) {
        case LL:
            angle = 0.89;
            break;
        case LC:
            angle = 0.59;
            break;
        case CC:
            angle = 0.0;
            break;
        case RC:
            angle = -0.59;
            break;
        case RR :
            angle = -0.89;
            break;
    }
    CATransform3D startingTransofrm = CATransform3DIdentity;
    startingTransofrm.m34 = -1.0/500;
    CATransform3D rotationTransform = CATransform3DRotate(startingTransofrm, angle, 0, 1, 0);
    self.layer.transform = rotationTransform;
}

@end
