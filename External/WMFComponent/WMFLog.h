//
//  WMFLog.h
//  TextOCR
//
//  Created by MingFanWang on 13-8-28.
//  Copyright (c) 2013年 MingFanWang. All rights reserved.
//
//  第一个参数是个数
//  第2+n个参数是输出
//  _string(@"2",@"hello",@"world");
//  _integer(3,1,2,3);
//  _float(2,2.3,3.4);

//#define SLog(s,...) [SLog file:__FILE__ function: (char *)__FUNCTION__ lineNumber:__LINE__ format:(s),##__VA_ARGS__]
#define _id(len,...) [WMFLog _id:(len),##__VA_ARGS__]
#define _string(len,...) [WMFLog _string:(len),##__VA_ARGS__]
#define _integer(len,...) [WMFLog _integer:(len),##__VA_ARGS__]
#define _float(len,...) [WMFLog _float:(len),##__VA_ARGS__]

@interface WMFLog : NSObject

//+(void) file:(char*)sourceFile function:(char*)functionName lineNumber:(int)lineNumber format:(NSString*)format, ...;
+(void) _id:(int) len,...;
+(void) _string:(int) len,...;
+(void) _integer:(int) len,...;
+(void) _float:(int) len,...;

@end
