//
//  WMFView.m
//  TextOCR
//
//  Created by MingFanWang on 13-8-28.
//  Copyright (c) 2013年 MingFanWang. All rights reserved.
//

#import "WMFView.h"

@implementation WMFView

@synthesize x=_x;
@synthesize y=_y;
@synthesize width=_width;
@synthesize height=_height;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.x=frame.origin.x;
    self.y=frame.origin.y;
    self.width=frame.size.width;
    self.height=frame.size.height;
}

-(void) setOrigin:(CGFloat) x y:(CGFloat) y
{
    self.x=x;
    self.y=y;
    self.frame=CGRectMake(x, y, self.frame.size.width, self.frame.size.height);
}

-(void) setSize:(CGFloat) width height:(CGFloat) height
{
    self.width=width;
    self.height=height;
    self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height);
}

@end
