//
//  WMFScaleBox.h
//  TextOCR
//
//  Created by MingFanWang on 13-8-28.
//  Copyright (c) 2013年 MingFanWang. All rights reserved.
//

#import "WMFView.h"
#import "WMFFrame.h"
#import "WMFDrag.h"

@interface WMFScaleBox : WMFView
{
    WMFFrame *fra;
    WMFDrag *top;
    WMFDrag *bottom;
    WMFDrag *left;
    WMFDrag *right;
    CGPoint childLocation;
    CGPoint selfLocation;
}
//获得选择的frame
-(CGRect) getSelectedFrame;

@end
