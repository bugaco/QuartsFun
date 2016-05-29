//
//  LYZQuartzFunView.h
//  QuartzFun
//
//  Created by 李懿哲 on 5/29/16.
//  Copyright © 2016 李懿哲. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYZConstants.h"

@interface LYZQuartzFunView : UIView

@property (assign, nonatomic)CGPoint firstTouchLocation;
@property (assign, nonatomic)CGPoint lastTouchLocation;
@property (assign, nonatomic)ShapeType shapeType;
@property (assign, nonatomic)BOOL useRandomColor;
@property (strong, nonatomic)UIColor *currentColor;
@property (strong, nonatomic)UIImage *drawImage;
@property (readonly, nonatomic)CGRect currentRect;
@property (assign, nonatomic)CGRect redrawRect;

@end
