//
//  WMFUtil.h
//  TextOCR
//
//  Created by MingFanWang on 13-8-28.
//  Copyright (c) 2013年 MingFanWang. All rights reserved.
//

@interface WMFUtil : NSObject
{

}
//获得一个ARGB颜色
+(UIColor *) RGBA:(CGFloat) read green:(CGFloat) green blue:(CGFloat) blue alpha:(CGFloat) alpha;
//根据文件名获取该文件相对于当前工程的绝对路径
+(NSString *) AbsolutePathWithFileName:(NSString *) fileName;

@end
