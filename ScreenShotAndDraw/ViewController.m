//
//  ViewController.m
//  ScreenShotAndDraw
//
//  Created by Jimmy on 16/2/17.
//  Copyright © 2016年 Jimmy. All rights reserved.
//

#import "ViewController.h"
#import "ToolBarDraw.h"
#import "ShowDrawViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if ([gestureRecognizer isEqual:self.navigationController.interactivePopGestureRecognizer]) {
        return NO;
    } else {
        return YES;
    }
}

- (UIImage *)getScreenShotImage {
    CGRect rect = self.view.frame;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"shake");
    UIImage *screenShot = [self getScreenShotImage];
    ToolBarDraw *toolBarDraw = [[ToolBarDraw alloc] initWithFrame:self.view.bounds];
    [toolBarDraw setBackgroundImage:screenShot];
    
    __weak typeof(self) weakSelf = self;
    [toolBarDraw setFinishDrawBlock:^(UIImage *image) {
        ShowDrawViewController *showPage = [self.storyboard instantiateViewControllerWithIdentifier:@"showDrawPage"];
        showPage.image = image;
        [weakSelf.navigationController pushViewController:showPage animated:YES];
    }];
    [self.view addSubview:toolBarDraw];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
