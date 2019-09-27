//
//  WMFDrag.h
//  TextOCR
//
//  Created by MingFanWang on 13-8-28.
//  Copyright (c) 2013年 MingFanWang. All rights reserved.
//

#import "WMFView.h"

@interface WMFDrag : WMFView
{
    UIImageView *imageView;
}
-(id)initWithFileName:(NSString *) fileName;

@end
