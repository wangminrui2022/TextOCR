//
//  WMFDrag.m
//  TextOCR
//
//  Created by MingFanWang on 13-8-28.
//  Copyright (c) 2013年 MingFanWang. All rights reserved.
//

#import "WMFDrag.h"
#import "WMFUtil.h"

@implementation WMFDrag

#pragma mark
#pragma mark 公共方法
-(id)initWithFileName:(NSString *) fileName
{
    self = [super init];
    if (self) {
        imageView=[self imageViewWithFileName:fileName];
        imageView.frame=CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height);
        [self addSubview:imageView];
        self.frame=imageView.frame;
    }
    return self;
}
-(void) dealloc
{
    [imageView release],imageView=nil;
    [super dealloc];
}

#pragma mark
#pragma mark 私有方法
-(UIImageView *) imageViewWithFileName:(NSString *) fileName
{
    UIImage *image=[[UIImage alloc] initWithContentsOfFile:[WMFUtil AbsolutePathWithFileName:fileName]];
    UIImageView *iv=[[UIImageView alloc] initWithImage:image];
    iv.frame=CGRectMake(0, 0, image.size.width, image.size.height);
    [image release],image=nil;
    return iv;
}

@end
