//
//  DrawView.h
//  ScreenShotAndDraw
//
//  Created by Jimmy on 16/2/17.
//  Copyright © 2016年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DrawingMode) {
    DrawingModeNone = 0,
    DrawingModePaint,
    DrawingModeErase,
};
typedef NS_ENUM(NSInteger, DrawingStatus)
{
    DrawingStatusBegin,//准备绘制
    DrawingStatusMove,//正在绘制
    DrawingStatusEnd//结束绘制
};

typedef void(^drawStatusBlock)(DrawingStatus drawingStatus);

@interface DrawView : UIView

@property (nonatomic, readwrite) DrawingMode drawingMode;
@property (nonatomic, strong) UIImage * viewImage;
@property (nonatomic, strong) UIColor *selectedColor;

- (void)drawingStatus:(drawStatusBlock)stautsBlock;

@end
