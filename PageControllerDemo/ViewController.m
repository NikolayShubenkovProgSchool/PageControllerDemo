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

    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:pageController];
    pageController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                                   target:pageController
                                                                                                   action:@selector(dismissModalViewControllerAnimated:)];
    
    [self presentViewController:nvc animated:YES completion:nil];
}



@end
