//
//  WMFFrame.m
//  TextOCR
//
//  Created by MingFanWang on 13-8-28.
//  Copyright (c) 2013年 MingFanWang. All rights reserved.
//

#import "WMFFrame.h"
#import "WMFUtil.h"

@implementation WMFFrame

#pragma mark
#pragma mark 公共方法
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [[WMFUtil RGBA:4.0 green:174.0 blue:218.0 alpha:1.0] CGColor]);
    CGContextSetRGBFillColor(context, 0.9, 0.9, 0.9, 0.2);
    CGContextAddRect(context, CGRectMake(1.0, 1.0, drawWidth, drawHeight));
    CGContextDrawPath(context, kCGPathFillStroke);
}

-(void) setFrame:(CGRect)frame
{
    [super setFrame:frame];
    drawWidth=self.frame.size.width-2.0;
    drawHeight=self.frame.size.height-2.0;
}


@end
