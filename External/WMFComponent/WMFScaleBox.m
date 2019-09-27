//
//  WMFScaleBox.m
//  TextOCR
//
//  Created by MingFanWang on 13-8-28.
//  Copyright (c) 2013年 MingFanWang. All rights reserved.
//

#import "WMFScaleBox.h"

@implementation WMFScaleBox

#pragma mark
#pragma mark 公共方法

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //UIImage *image=[UIImage imageNamed:@"mm.jpg"];
        //UIImageView *imageView=[[UIImageView alloc] initWithImage:image];
        //[self addSubview:imageView];
        //[image release],image=nil;
        //选择框
        //_float(4,self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height);
        float _w=150.0;
        float _h=150.0;
        float _x=(self.frame.size.width-_w)/2;
        float _y=(self.frame.size.height-_h)/2;
        //_float(2,_x,_y);
        fra=[[WMFFrame alloc] initWithFrame:CGRectMake(_x, _y, _w, _h)];
        [self addSubview:fra];
        //上
        top=[[WMFDrag alloc] initWithFileName:@"TB.png"];
        [self addSubview:top];
        [top setOrigin:fra.x+(fra.width-top.width)/2 y:fra.y-top.height];
        //下
        bottom=[[WMFDrag alloc] initWithFileName:@"TB.png"];
        [self addSubview:bottom];
        [bottom setOrigin:fra.x+(fra.width-bottom.width)/2 y:fra.y+fra.height];
        //左
        left=[[WMFDrag alloc] initWithFileName:@"LR.png"];
        [self addSubview:left];
        [left setOrigin:fra.x-left.width y:fra.y+(fra.height-left.height)/2];
        //右
        right=[[WMFDrag alloc] initWithFileName:@"LR.png"];
        [self addSubview:right];
        [right setOrigin:fra.x+fra.width y:fra.y+(fra.height-right.height)/2];
    }
    return self;
}

-(void) dealloc
{
    //self.delegate=nil;
    //_delegate=nil;
    [fra release],fra=nil;
    [top release],top=nil;
    [bottom release],bottom=nil;
    [left release],left=nil;
    [right release],right=nil;
    [super dealloc];
}

-(CGRect) getSelectedFrame
{
    return fra.frame;
}

#pragma mark
#pragma mark 重写父类方法

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    selfLocation=[touch locationInView:self];
    if([touch view]==fra)
    {
        childLocation=[touch locationInView:fra];
    }
    else if([touch view]==top)
    {
        childLocation=[touch locationInView:top];
    }
    else if([touch view]==bottom)
    {
        childLocation=[touch locationInView:bottom];
    }
    else if([touch view]==left)
    {
        childLocation=[touch locationInView:left];
    }
    else if([touch view]==right)
    {
        childLocation=[touch locationInView:right];
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    selfLocation=[touch locationInView:self];
    CGFloat moveY;
    CGFloat moveX;
    if([touch view]==fra)
    {
        [fra setOrigin:selfLocation.x-childLocation.x y:selfLocation.y-childLocation.y];
        [top setOrigin:fra.x+(fra.width-top.width)/2 y:fra.y-top.height];
        [bottom setOrigin:fra.x+(fra.width-bottom.width)/2 y:fra.y+fra.height];
        [left setOrigin:fra.x-left.width y:fra.y+(fra.height-left.height)/2];
        [right setOrigin:fra.x+fra.width y:fra.y+(fra.height-right.height)/2];
    }
    else if([touch view]==top)
    {
        moveY=top.y-(selfLocation.y-childLocation.y);
        [top setOrigin:fra.x+(fra.width-top.width)/2 y:selfLocation.y-childLocation.y];
        fra.frame=CGRectMake(fra.x,top.y+top.height,fra.width,fra.height+moveY);
        [fra setNeedsDisplay];
        [bottom setOrigin:fra.x+(fra.width-bottom.width)/2 y:fra.y+fra.height];
        [left setOrigin:fra.x-left.width y:fra.y+(fra.height-left.height)/2];
        [right setOrigin:fra.x+fra.width y:fra.y+(fra.height-right.height)/2];
    }
    else if([touch view]==bottom)
    {
        moveY=bottom.y-(selfLocation.y-childLocation.y);
        [bottom setOrigin:fra.x+(fra.width-bottom.width)/2 y:selfLocation.y-childLocation.y];
        fra.frame=CGRectMake(fra.x,fra.y,fra.width,fra.height-moveY);
        [fra setNeedsDisplay];
        [top setOrigin:fra.x+(fra.width-top.width)/2 y:fra.y-top.height];
        [left setOrigin:fra.x-left.width y:fra.y+(fra.height-left.height)/2];
        [right setOrigin:fra.x+fra.width y:fra.y+(fra.height-right.height)/2];
    }
    else if([touch view]==left)
    {
        moveX=left.x-(selfLocation.x-childLocation.x);
        [left setOrigin:selfLocation.x-childLocation.x y:fra.y+(fra.height-left.height)/2];
        fra.frame=CGRectMake(left.x+left.height,fra.y,fra.width+moveX,fra.height);
        [fra setNeedsDisplay];
        [top setOrigin:fra.x+(fra.width-top.width)/2 y:fra.y-top.height];
        [bottom setOrigin:fra.x+(fra.width-bottom.width)/2 y:fra.y+fra.height];
        [right setOrigin:fra.x+fra.width y:fra.y+(fra.height-right.height)/2];
    }
    else if([touch view]==right)
    {
        moveX=right.x-(selfLocation.x-childLocation.x);
        [right setOrigin:selfLocation.x-childLocation.x y:fra.y+(fra.height-right.height)/2];
        fra.frame=CGRectMake(fra.x,fra.y,fra.width-moveX,fra.height);
        [fra setNeedsDisplay];
        [top setOrigin:fra.x+(fra.width-top.width)/2 y:fra.y-top.height];
        [bottom setOrigin:fra.x+(fra.width-bottom.width)/2 y:fra.y+fra.height];
        [left setOrigin:fra.x-left.width y:fra.y+(fra.height-left.height)/2];
    }
}

@end
