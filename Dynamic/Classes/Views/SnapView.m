//
//  SnapView.m
//  Dynamic
//
//  Created by my young on 16/5/15.
//  Copyright © 2016年 lijiongjiong. All rights reserved.
//

#import "SnapView.h"

@implementation SnapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //  创建点按手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        
        //  添加到View
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)tapClick:(UITapGestureRecognizer *)recognezer {
    
    //  每次执行行为前,先把之前的行为删除
    [self.dynam removeAllBehaviors];
    
    //  获取当前点按的点
    CGPoint loc = [recognezer locationInView:self];
    
    //  创建吸附行为
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.boxView snapToPoint:loc];
    
    //  振幅的属性 (值越大, 振幅越小: 0.0 -- 1.0之间) 
    // damping value from 0.0 to 1.0. 0.0 is the least oscillation.
    snap.damping = 0.1;
    
    //  添加到当前的View上
    [self.dynam addBehavior:snap];
}



@end
