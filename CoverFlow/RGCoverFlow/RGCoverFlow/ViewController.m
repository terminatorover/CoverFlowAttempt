//
//  ViewController.m
//  RGCoverFlow
//
//  Created by ROBERA GELETA on 11/23/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *coverFlowContainer;

@end

@implementation ViewController
{
    CGFloat angle;
    CATransformLayer *transformLayer;
    NSInteger countItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    transformLayer = [CATransformLayer layer];
    transformLayer.frame =  self.coverFlowContainer.bounds;
    [self.coverFlowContainer.layer addSublayer:transformLayer];
    angle = 0;
    countItem = 0;
    [self addLayer];
    [self addLayer];
    [self addLayer];
    [self addLayer];
    [self addLayer];
    [self animate];
    
    
}


- (void)addLayer
{
    CALayer  *layer = [[CALayer alloc]init];
//    layer.doubleSided = YES;
    layer.frame = CGRectMake(100, 50, 120, 120);
    layer.anchorPoint = CGPointMake(.5, .5);
    layer.cornerRadius = 20.0;
//    NSUInteger r = arc4random_uniform(3);
    CGColorRef color = [UIColor redColor].CGColor;
    layer.backgroundColor = color;
    [transformLayer addSublayer:layer];
    layer.contents = (__bridge id)([self imageForNumber:countItem]);
    countItem ++;
    
}

- (CGColorRef)imageForNumber:(NSInteger)counter
{
    if(counter == 0 )
    {
        return (id)[UIImage imageNamed:@"i1"].CGImage;
    }
    if(counter == 1)
    {
        return (id)[UIImage imageNamed:@"i2"].CGImage;
    }
    if(counter == 2 )
    {
        return (id)[UIImage imageNamed:@"i3"].CGImage;
    }
    if(counter == 3)
    {
        return (id)[UIImage imageNamed:@"i4"].CGImage;
    }
    if(counter == 4 )
    {
        return (id)[UIImage imageNamed:@"i5"].CGImage;
    }
    return (id)[UIImage imageNamed:@"i5"].CGImage;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)panning:(UIPanGestureRecognizer *)sender
{
    UIPanGestureRecognizer *panning = (UIPanGestureRecognizer *)sender;
    if(panning.state == UIGestureRecognizerStateBegan)
    {
        
    }
    else if(panning.state == UIGestureRecognizerStateChanged)
    {
//        angle = (abs([panning translationInView:self.coverFlowContainer].x)/300 ) *360;
        angle = (([panning translationInView:self.coverFlowContainer].x)) *(360/300);
        NSLog(@"Angle:%f",angle);
        [self animate];
    }
    else if(panning.state == UIGestureRecognizerStateEnded)
    {
        
    }
    
    
}

- (NSInteger )angleFromLayerNumber:(NSInteger)number
{
    
    switch (number) {
        case 0:
            return 0;
        case 1:
            return 40;
        case 2:
            return 80 ;
        case 3:
            return 140;
        case 4:
            return 170;
    }
    return 0;
}

- (void)animate
{
    
    NSArray *listOfLayers = [transformLayer sublayers];
    NSInteger count = 0 ;
    
    for (CALayer *aLayer in listOfLayers)
    {
        [CATransaction setAnimationDuration:0.0];
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = 1.0f / - 1000.0f;
        NSInteger modifiedAngle = [self angleFromLayerNumber:count];
        modifiedAngle += angle;
        CGFloat radians = [self radToAngle:modifiedAngle];
        transform = CATransform3DRotate(transform, radians, 0, 1, 0);
        transform = CATransform3DTranslate(transform, 0, 0, 250);

        aLayer.transform = transform;

        count++;
    }
}

- (CGFloat )radToAngle:(CGFloat)givenAngle
{
    return (givenAngle *  M_PI ) / 180;
}

@end
