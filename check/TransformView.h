//
//  TransformView.h
//  check
//
//  Created by ROBERA GELETA on 11/23/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
typedef enum {
    LL,
    LC,
    CC,
    RC,
    RR
} VIEW_STATE_POSITION;




@interface TransformView : UIView
- (void)setState:(VIEW_STATE_POSITION)state ;
@end

