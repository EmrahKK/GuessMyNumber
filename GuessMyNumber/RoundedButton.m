//
//  RoundedButton.m
//  GuessMyNumber
//
//  Created by Emrah on 27.06.2014.
//  Copyright (c) 2014 Emrah. All rights reserved.
//

#import "RoundedButton.h"

@implementation RoundedButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)renderBackround {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.frame cornerRadius:10];
//    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height/2)];
//    [path addLineToPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)];
//    [path addLineToPoint:CGPointMake(self.frame.size.width/2, 0)];
//    
//    [path addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
//                    radius:self.frame.size.width/2
//                startAngle:DEGREES_TO_RADIANS(0)
//                  endAngle:DEGREES_TO_RADIANS(270)
//                 clockwise:YES];
//    
    
    CAShapeLayer *back = [[CAShapeLayer alloc] init];
    back.path = [path CGPath];
    back.fillColor = [[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.3] CGColor];
    back.strokeColor = [[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1] CGColor];
    back.lineWidth = 2;
    [self.layer addSublayer:back];
}

@end
