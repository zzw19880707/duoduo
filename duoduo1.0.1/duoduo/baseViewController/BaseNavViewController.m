//
//  BaseNavViewController.m
//  tabbartest
//
//  Created by 佐筱猪 on 13-10-15.
//  Copyright (c) 2013年 佐筱猪. All rights reserved.
//

#import "BaseNavViewController.h"
@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)test{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadBackgroundImage];
    
    UISwipeGestureRecognizer *swipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self
                                                                                    action:@selector(swipeGestureAction:)];
    //只监听向右滑动，每个手势只监听一个事件
    swipeGesture.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGesture];
}
/*
//自定义数据从上到下展示动画
- (void)customPushViewController:(UIViewController *)viewController
{
    viewController.view.frame = (CGRect){0, -viewController.view.frame.size.height, viewController.view.frame.size};
    [self pushViewController:viewController animated:NO];
    [UIView animateWithDuration:1
                     animations:^{
                         viewController.view.frame = (CGRect){0, 0, self.view.bounds.size};
                     }];
}
//从左到右
- (void)customLeftToRightPushViewController:(UIViewController *)viewController
{
    viewController.view.frame = (CGRect){-viewController.view.frame.size.width, 0, viewController.view.frame.size};
    [self pushViewController:viewController animated:NO];
    [UIView animateWithDuration:1
                     animations:^{
                         viewController.view.frame = (CGRect){0, 0, self.view.bounds.size};
                     }];
}

//系统动画
- (void)pushViewController: (UIViewController*)controller
            animatedWithTransition: (UIViewAnimationTransition)transition {
    [self pushViewController:controller animated:NO];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(pushAnimationDidStop)];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
    
}
- (UIViewController*)popViewControllerAnimatedWithTransition:(UIViewAnimationTransition)transition {
    UIViewController* poppedController = [self popViewControllerAnimated:NO];

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(pushAnimationDidStop)];
    [UIView setAnimationTransition:transition forView:self.view cache:NO];
    [UIView commitAnimations];
    
    return poppedController;
}
*/
//返回手势
-(void)swipeGestureAction:(UISwipeGestureRecognizer *)gesture{
    
    if ([self.viewControllers count]>1) {
        if(gesture.direction==UISwipeGestureRecognizerDirectionRight){
            [self popViewControllerAnimated:YES];
        }
    }
    
}

-(void)loadBackgroundImage{
    float version=[[[UIDevice currentDevice]systemVersion]floatValue];
    
    if(version>5.0&&version<7.0){
        UIImage *image=[UIImage imageNamed:@"nav_background.png"];
//        UIEdgeInsets inset = UIEdgeInsetsMake(0,120,0,1);

//        [image s:120 topCapHeight:10];
//        [self.navigationBar setBackgroundImage: [image resizableImageWithCapInsets:inset ] forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }else{
        UIImage *image=[UIImage imageNamed:@"nav_background7.png"];
        [self.navigationBar setBackgroundImage: image forBarMetrics:UIBarMetricsDefault];

    }
}


@end
