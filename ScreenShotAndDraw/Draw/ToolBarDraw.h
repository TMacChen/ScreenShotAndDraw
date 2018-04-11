//
//  ToolBarDraw.h
//  ScreenShotAndDraw
//
//  Created by Jimmy on 16/2/18.
//  Copyright © 2016年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolBarDraw : UIView

@property(nonatomic, copy) void(^finishDrawBlock)(UIImage *image);

- (void)setBackgroundImage:(UIImage *)image;


@end
