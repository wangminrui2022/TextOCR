//
//  WMFLog.m
//  TextOCR
//
//  Created by MingFanWang on 13-8-28.
//  Copyright (c) 2013年 MingFanWang. All rights reserved.
//

#import "WMFLog.h"

@implementation WMFLog

//+ (void)file:(char*)sourceFile function:(char*)functionName lineNumber:(int)lineNumber format:(NSString*)format, ...
//{
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    va_list ap;
//    NSString *print, *file, *function;
//    va_start(ap,format);
//    file = [[NSString alloc] initWithBytes: sourceFile length: strlen(sourceFile) encoding: NSUTF8StringEncoding];
//    function = [NSString stringWithCString:functionName encoding:NSUTF8StringEncoding];
//    print = [[NSString alloc] initWithFormat: format arguments: ap];
//    va_end(ap);
//    NSLog(@"%@:%d %@; %@", [file lastPathComponent], lineNumber, function, print);
//    [print release];
//    [file release];
//    [pool release];
//}

+(void) _id:(int) len,...
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    va_list ap;
    va_start(ap,len);
    //输出剩余字符串,第一个参数默认为输出总个数
    for(int x=0;x<len;x++)
    {
        id value=va_arg(ap,id);
        NSLog(@"%@",value);
    }
    va_end(ap);
    [pool release];
}

+(void) _string:(int) len,...
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    va_list ap;
    va_start(ap,len);
    NSString *print=@"";
    //输出剩余字符串,第一个参数默认为输出总个数
    for(int x=0;x<len;x++)
    {
        NSString *value=va_arg(ap,NSString*);
        if(x<len-1)
        {
            print=[print stringByAppendingFormat:@"%@,",value];
        }
        else
        {
            print=[print stringByAppendingFormat:@"%@",value];
        }
    }
    NSLog(@"%@",print);
    va_end(ap);
    [pool release];
}

+(void) _integer:(int) len,...
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    va_list ap;
    va_start(ap,len);
    NSString *print=@"";
    for(int x=0;x<len;x++)
    {
        NSInteger value=va_arg(ap,NSInteger);
        if(x<len-1)
        {
            print=[print stringByAppendingFormat:@"%d,",value];
        }
        else
        {
            print=[print stringByAppendingFormat:@"%d",value];
        }
    }
    NSLog(@"%@",print);
    va_end(ap);
    [pool release];
}

+(void) _float:(int) len,...
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    va_list ap;
    va_start(ap,len);
    NSString *print=@"";
    for(int x=0;x<len;x++)
    {
        CGFloat value=va_arg(ap,double);
        if(x<len-1)
        {
            print=[print stringByAppendingFormat:@"%f,",value];
        }
        else
        {
            print=[print stringByAppendingFormat:@"%f",value];
        }
        
    }
    NSLog(@"%@",print);
    va_end(ap);
    [pool release];
}

@end
