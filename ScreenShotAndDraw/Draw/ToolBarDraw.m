//
//  ToolBarDraw.m
//  ScreenShotAndDraw
//
//  Created by Jimmy on 16/2/18.
//  Copyright © 2016年 Jimmy. All rights reserved.
//

#import "ToolBarDraw.h"
#import "DrawView.h"
#import "DrawBgView.h"

@interface ToolBarDraw ()
{
    UIToolbar *toolBar;
}
@property (strong, nonatomic) DrawBgView *drawBgView;
@end

@implementation ToolBarDraw

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
    
    toolBar = [self setToolBar];
    
    self.drawBgView = [[DrawBgView alloc]initWithFrame:self.bounds];
    [self.drawBgView drawingStatus:^(DrawingStatus drawingStatus) {
        switch (drawingStatus) {
            case DrawingStatusBegin:
                toolBar.hidden = YES;
                break;
            case DrawingStatusMove:
                break;
            case DrawingStatusEnd:
                toolBar.hidden = NO;
                break;
            default:
                break;
        }
    }];
    [self addSubview:self.drawBgView];
    [self addSubview:toolBar];
}

- (void)setBackgroundImage:(UIImage *)image {
    [self.drawBgView setBackgroundImage:image];
}

- (void)setFinishDrawBlock:(void (^)(UIImage *))finishDrawBlock {
    [self.drawBgView setFinishDrawBlock:finishDrawBlock];
}

- (UIToolbar *)setToolBar {
    UIToolbar *bar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 64.0)];
    bar.backgroundColor = [UIColor blackColor];
    UIBarButtonItem *paint = [[UIBarButtonItem alloc] initWithTitle:@"Paint" style:UIBarButtonItemStylePlain target:self action:@selector(startPaint)];
    UIBarButtonItem *eraser = [[UIBarButtonItem alloc] initWithTitle:@"Eraser" style:UIBarButtonItemStylePlain target:self action:@selector(startEraser)];
    UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *trash = [[UIBarButtonItem alloc] initWithTitle:@"Trash" style:UIBarButtonItemStylePlain target:self action:@selector(clearPaint)];
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(savePaint)];
    bar.items = [NSArray arrayWithObjects:paint,eraser,flex,trash,save,nil];
    return bar;
}

#pragma button action
- (void)startPaint {
    [self.drawBgView startPaint];
}

- (void)clearPaint {
    [self.drawBgView clearPaint];
}

- (void)startEraser {
    [self.drawBgView startEraser];
}

- (void)savePaint {
    [self.drawBgView savePaint];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
