//
//  DrawBgView.m
//  ScreenShotAndDraw
//
//  Created by Jimmy on 16/2/18.
//  Copyright © 2016年 Jimmy. All rights reserved.
//

#import "DrawBgView.h"

@interface DrawBgView ()

@property (strong, nonatomic) DrawView *drawView;
@property (strong, nonatomic) UIImageView *backGroundImageView;

@end

@implementation DrawBgView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.backgroundColor = [UIColor clearColor];
    
    self.backGroundImageView = [[UIImageView alloc]initWithFrame:self.bounds];
    self.backGroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.backGroundImageView];
    
    self.drawView = [[DrawView alloc] initWithFrame:self.bounds];
    [self addSubview:self.drawView];
}

- (void)drawingStatus:(drawStatusBlock)stautsBlock {
    [self.drawView drawingStatus:stautsBlock];
}

- (void)setBackgroundImage:(UIImage *)image {
    self.backGroundImageView.image = image;
}

#pragma button action
- (void)startPaint {
    [self.drawView setDrawingMode:DrawingModePaint];
}

- (void)clearPaint {
    self.drawView.viewImage = nil;
    [self.drawView setNeedsDisplay];
    [self.drawView setDrawingMode:DrawingModePaint];
}

- (void)startEraser {
    [self.drawView setDrawingMode:DrawingModeErase];
}

- (void)savePaint {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.layer renderInContext:context];
    
    UIImage *getImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(getImage, nil, nil, nil);
    if (self.finishDrawBlock) {
        self.finishDrawBlock(getImage);
    }
}

@end
