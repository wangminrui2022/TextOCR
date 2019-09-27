//
//  WMFUtil.m
//  TextOCR
//
//  Created by MingFanWang on 13-8-28.
//  Copyright (c) 2013年 MingFanWang. All rights reserved.
//

#import "WMFUtil.h"

@implementation WMFUtil

+(UIColor *) RGBA:(CGFloat) read green:(CGFloat) green blue:(CGFloat) blue alpha:(CGFloat) alpha;
{
    return [UIColor colorWithRed:read/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+(NSString *) AbsolutePathWithFileName:(NSString *) fileName
{
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
}

@end
