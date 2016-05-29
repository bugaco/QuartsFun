//
//  UIColor+LYZRandom.m
//  QuartzFun
//
//  Created by 李懿哲 on 5/29/16.
//  Copyright © 2016 李懿哲. All rights reserved.
//

#import "UIColor+LYZRandom.h"

#define ARC4RRANDOM_MAX 0x100000000LL

@implementation UIColor (LYZRandom)
+ (UIColor *)randomColor{
    CGFloat red = (CGFloat)arc4random() / (CGFloat)ARC4RRANDOM_MAX;
    CGFloat blue = (CGFloat)arc4random() / (CGFloat)ARC4RRANDOM_MAX;
    CGFloat green = (CGFloat)arc4random() / (CGFloat)ARC4RRANDOM_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}
@end
