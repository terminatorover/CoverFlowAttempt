//
//  ViewController.m
//  check
//
//  Created by ROBERA GELETA on 11/3/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//







#import "ViewController.h"
#import "RGView.h"
#import "SmallViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *box;
@property (weak, nonatomic) IBOutlet UIImageView *image2;

@end

@implementation ViewController
{
    BOOL bs;
    NSString *as;
    
}


- (IBAction)valueChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
//    NSLog(@"%f",slider.value);
    CGFloat angle = slider.value * 100;
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = 1.0/-500;
    perspective = CATransform3DTranslate(perspective, angle, 0, 0);//CATransform3DRotate(perspective, angle * M_PI, 0, 1, 0);
    CATransform3D rotate = CATransform3DRotate(perspective, [self angleFromDistance:angle *3.60], 0, 1, 0);
    
    self.box.layer.transform = rotate;
    self.image2.layer.transform = rotate;
}


- (CGFloat )angleFromDistance:(CGFloat )distance
{
    CGFloat angle;
    NSLog(@"Distance: %f",distance);
    if(distance > 180 )
    {
        angle = ( 0.76/ -180) * abs(( 180- distance) );
    }
    else
    {
        angle = (0.78 / 180) *  abs(( 180- distance) );
    }
    return angle;
}

//- (NSString *)urlConstructionHelper:(BOOL)check
//{
//    if(!check)
//    {
//        check = YES;
//        return @"?";
//    }
//    return @"&";}

- (NSString *)validation:(NSString *)var
{
    if([var isEqualToString:@"yes"])
    {
        var = @"no";
        return @"Changed No to Yes";
    }
    var = @"yes";
    return @"Changed No to Yes ";
}
static BOOL check ;

- (IBAction)tapped:(id)sender {
    
    if(!check)
    {
        [UIView animateWithDuration:2 animations:^{
//            self.box.transform = CGAffineTransformMakeScale(.4, .4);
            CATransform3D perspective = CATransform3DIdentity;
            perspective.m34 = 1.0/-500;
            perspective = CATransform3DRotate(perspective, 45.0 * M_PI, 0, 1, 0);
            self.box.layer.transform = perspective;
        }];
        check = YES;
        
    }
    else{
        [UIView animateWithDuration:2
                         animations:^{
//        self.box.transform = CGAffineTransformMakeScale(1, 1);
                              CATransform3D perspective = CATransform3DIdentity;
                             perspective.m34 = 1.0/-500;
                             perspective = CATransform3DRotate(perspective, 45.0 * M_PI, 0, 1, 0);
                             self.box.layer.transform = perspective;
        }];
        check = NO;
        
    }

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    check = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreaated.
    

}

NSString* encodeToPercentEscapeString(NSString *string) {
    return (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                            (CFStringRef) string,
                                            NULL,
                                            (CFStringRef) @"!*'();:@&=+$,/?%#[]",
                                            kCFStringEncodingUTF8));
}

@end


/**
 This creates a new query parameters string from the given NSDictionary. For
 example, if the input is @{@"day":@"Tuesday", @"month":@"January"}, the output
 string will be @"day=Tuesday&month=January".
 @param queryParameters The input dictionary.
 @return The created parameters string.
 */
static NSString* NSStringFromQueryParameters(NSDictionary* queryParameters)
{
    NSMutableArray* parts = [NSMutableArray array];
    [queryParameters enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        NSString *part = [NSString stringWithFormat: @"%@=%@",
                          [key stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding],
                          [value stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]
                          ];
        [parts addObject:part];
    }];
    return [parts componentsJoinedByString: @"&"];
}

