//
//  DrawBgView.h
//  ScreenShotAndDraw
//
//  Created by Jimmy on 16/2/18.
//  Copyright © 2016年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawView.h"

@interface DrawBgView : UIView

@property(nonatomic, copy) void(^finishDrawBlock)(UIImage *image);

- (void)setBackgroundImage:(UIImage *)image;
- (void)drawingStatus:(drawStatusBlock)stautsBlock;

#pragma button action
- (void)startPaint;
- (void)clearPaint;
- (void)startEraser;
- (void)savePaint;

@end
