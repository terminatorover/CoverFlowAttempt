    //
//  SmallViewController.m
//  check
//
//  Created by ROBERA GELETA on 11/7/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "SmallViewController.h"

@interface SmallViewController ()

@end

@implementation SmallViewController
- (IBAction)pressed:(id)sender {
    NSLog(@"Pressed");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:[[UIViewController alloc]init]];
//    [self presentViewController:navC animated:NO completion:^{
//        NSLog(@"presnted VC");
//    }];
    
    
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
