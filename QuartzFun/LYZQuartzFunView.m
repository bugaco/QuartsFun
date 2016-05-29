//
//  LYZQuartzFunView.m
//  QuartzFun
//
//  Created by 李懿哲 on 5/29/16.
//  Copyright © 2016 李懿哲. All rights reserved.
//

#import "LYZQuartzFunView.h"
#import "UIColor+LYZRandom.h"


@implementation LYZQuartzFunView

- (CGRect)currentRect{
    return CGRectMake(self.firstTouchLocation.x, self.firstTouchLocation.y, self.lastTouchLocation.x - self.firstTouchLocation.x, self.lastTouchLocation.y - self.firstTouchLocation.y);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        _currentColor = [UIColor redColor];
        _useRandomColor = NO;
        _drawImage = [UIImage imageNamed:@"beautiful girl"];
    }
    return self;
}

#pragma mark - Touch Handling

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.useRandomColor) {
        self.currentColor = [UIColor randomColor];
    }
    UITouch *touch = [touches anyObject];
    self.firstTouchLocation = [touch locationInView:self];
    self.lastTouchLocation = [touch locationInView:self];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInView:self];
    
    if (self.shapeType == kImageShape) {
        CGFloat horizontalOffset = self.drawImage.size.width / 2;
        CGFloat verticalOffset = self.drawImage.size.height / 2;
        self.redrawRect = CGRectUnion(self.redrawRect, CGRectMake(self.lastTouchLocation.x - horizontalOffset, self.lastTouchLocation.y - verticalOffset, self.drawImage.size.width, self.drawImage.size.height));
    }else{
        self.redrawRect = CGRectUnion(self.redrawRect, self.currentRect);
    }
    self.redrawRect = CGRectInset(self.redrawRect, -2, -2);
    [self setNeedsDisplayInRect:self.redrawRect];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInView:self];
    
    if (self.shapeType == kImageShape) {
        CGFloat horizontalOffset = self.drawImage.size.width / 2;
        CGFloat verticalOffset = self.drawImage.size.height / 2;
        self.redrawRect = CGRectUnion(self.redrawRect, CGRectMake(self.lastTouchLocation.x - horizontalOffset, self.lastTouchLocation.y - verticalOffset, self.drawImage.size.width, self.drawImage.size.height));
    }
    self.redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    [self setNeedsDisplayInRect:self.redrawRect];
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3);
    CGContextSetStrokeColorWithColor(context, self.currentColor.CGColor);
    
    CGContextSetFillColorWithColor(context, self.currentColor.CGColor);
//    CGRect currentRect = CGRectMake(self.firstTouchLocation.x, self.firstTouchLocation.y, self.lastTouchLocation.x - self.firstTouchLocation.x, self.lastTouchLocation.y - self.firstTouchLocation.y);
    
    switch (self.shapeType) {
        case kLineShape:
            CGContextMoveToPoint(context, self.firstTouchLocation.x, self.firstTouchLocation.y);
            CGContextAddLineToPoint(context, self.lastTouchLocation.x, self.lastTouchLocation.y);
            CGContextStrokePath(context);
            break;
        case kRectShape:
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
            
        case kEllipseShape:
            CGContextAddEllipseInRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
            
        case kImageShape:
        {
            CGFloat horizontalOffset = self.drawImage.size.width / 2;
            CGFloat verticalOffest = self.drawImage.size.height / 2;
            CGPoint drawPoint = CGPointMake(self.lastTouchLocation.x - horizontalOffset, self.lastTouchLocation.y - verticalOffest);
            [self.drawImage drawAtPoint:drawPoint];
         break;
        }
            
        default:
            break;
    }
}
@end
