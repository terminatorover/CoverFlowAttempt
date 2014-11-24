//
//  RGCoverFlowViewController.m
//  check
//
//  Created by ROBERA GELETA on 11/23/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "RGCoverFlowViewController.h"
#import "TransformView.h"

@interface RGCoverFlowViewController ()
@property (weak, nonatomic) IBOutlet UIView *rg;
@property (weak, nonatomic) IBOutlet UIView *rg1;
@property (weak, nonatomic) IBOutlet UIView *rg2;
@property (weak, nonatomic) IBOutlet UIView *rg3;
@property (weak, nonatomic) IBOutlet TransformView *rg4;

@end

@implementation RGCoverFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    TransformView *mostLeftView = (TransformView *)self.rg;
    [mostLeftView setState:LL];
    
    TransformView *rg1View  = (TransformView *)self.rg1;
    [rg1View setState:LC];
    
    TransformView *rg2View = (TransformView *)self.rg2;
    [rg2View setState:CC];
    
    TransformView *rg3View = (TransformView *)self.rg3;
    [rg3View setState:RC];
    
    [self.rg4 setState:RR];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [UIView animateWithDuration:2
//                         animations:^{
//                             TransformView *mostLeftView = (TransformView *)self.rg;
//                             [mostLeftView setState:CC];
//        }];
//    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
