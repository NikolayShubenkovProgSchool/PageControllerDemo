//
//  ViewController.m
//  PageControllerDemo
//
//  Created by Nikolay Shubenkov on 31/08/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "ViewController.h"

#import "PageControllerDemo-Swift.h"

@interface ViewController ()

@property (nonatomic, strong) SNVPageControllerDelegate *pageControllerDelegate;

@end

@implementation ViewController


- (IBAction)showDemo:(id)sender {
    UIPageViewController *pageController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                                                          navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                                        options:nil];
    self.pageControllerDelegate = [[SNVPageControllerDelegate alloc]initWithPageController:pageController
                                                                        viewControllersIds:@[@"first",@"second",@"third"]
                                                                                storyboard:self.storyboard];
    [self presentViewController:pageController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
