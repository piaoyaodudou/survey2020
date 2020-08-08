//
//  MOButton.m
//  00.OCDemo
//
//  Created by 莫晓卉 on 2020/7/22.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOButton.h"

@implementation MOButton

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//  if ([self pointInside:point withEvent:event]) {
//    return [super hitTest:point withEvent:event];
//  }
//  return nil;
//}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//  CGFloat minX = self.frame.origin.x - 50;
//  CGFloat minY = self.frame.origin.y - 50;
//  CGFloat maxX = CGRectGetMaxX(self.frame) + 50;
//  CGFloat maxY = CGRectGetMaxY(self.frame) + 50;
//  CGRect rect = CGRectMake(minX, minY, maxX - minX, maxY - minY);
//  if (CGRectContainsPoint(rect, point)) {
  
  if (point.x >= -50 && point.x <= 150 && point.y >= -50 && point.y <= 150) {
    return YES;
  }
  return NO;
}



@end
