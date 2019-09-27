//
//  WMFView.h
//  TextOCR
//
//  Created by MingFanWang on 13-8-28.
//  Copyright (c) 2013年 MingFanWang. All rights reserved.
//

@interface WMFView : UIView
{

}
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

//设置当前x,y
-(void) setOrigin:(CGFloat) x y:(CGFloat) y;
//设置当前width,height
-(void) setSize:(CGFloat) width height:(CGFloat) height;

@end
