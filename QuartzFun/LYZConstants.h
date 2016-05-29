//
//  LYZConstants.h
//  QuartzFun
//
//  Created by 李懿哲 on 5/29/16.
//  Copyright © 2016 李懿哲. All rights reserved.
//

#ifndef LYZConstants_h
#define LYZConstants_h

typedef NS_ENUM (NSInteger, ShapeType){
    kLineShape = 0,
    kRectShape,
    kEllipseShape,
    kImageShape
};

typedef NS_ENUM(NSInteger, ColorTabIndex){
    kRedColorTab = 0,
    kBlueColorTab,
    kYelloColorTab,
    kGreenColorTab,
    kRandomColorTab
};

#define degressToRadian(x) (M_PI * (x) / 180.0)

#endif /* LYZConstants_h */
