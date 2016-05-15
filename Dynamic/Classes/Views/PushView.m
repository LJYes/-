//
//  PushView.m
//  Dynamic
//
//  Created by my young on 16/5/15.
//  Copyright © 2016年 lijiongjiong. All rights reserved.
//

#import "PushView.h"

@interface PushView ()

@property (assign, nonatomic) CGPoint loc; 

@property (assign, nonatomic) CGPoint currentP; //移动中的点

@property (weak, nonatomic) UIPushBehavior *push;

@end

@implementation PushView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // MARK: - 创建拖拽手势识别器
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panClick:)];
        
        //  添加到View上
        [self addGestureRecognizer:pan];
        
        
        // MARK: - 添加推动行为
        UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[self.boxView] mode:UIPushBehaviorModeInstantaneous];
        //  添加到仿真者对象上
        [self.dynam addBehavior:push];
        self.push = push;
        
        // MARK: - 碰撞边缘检测
        UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.boxView]];
        //  将参考范围转化为边界  translatesReferenceBoundsIntoBoundary
        collision.translatesReferenceBoundsIntoBoundary = YES;
        
        //  添加到仿真者对象
        [self.dynam addBehavior:collision];
        
    }
    return self;
}  

#pragma mark: - 拖拽手势的监听方法
- (void)panClick:(UIPanGestureRecognizer *)recognizer {
    //  获取当前点
    CGPoint loc = [recognizer locationInView:self];
    // MARK: - 拖拽开始
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        
        //  记录开始点
        self.loc = loc;
        
        //  把小图标的中心点设置为点按开始的中心点
        self.attView.center = loc;
        //  并取消隐藏
        self.attView.hidden = NO;
    // MARK: - 拖拽中
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        
        //  记录当前移动的点
        self.currentP = loc;
        //  不断的重绘
        [self setNeedsDisplay];
    // MARK: - 拖拽结束
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        // MARK: - 触摸推动行为
        //  计算偏移的距离   (根据修改center.x - x顺序可以改变推动的方向)
//        CGFloat offsetX = self.attView.center.x - self.currentP.x;
//        CGFloat offsetY = self.attView.center.y - self.currentP.y;
        CGFloat offsetX = self.currentP.x - self.attView.center.x;
        CGFloat offsetY = self.currentP.y - self.attView.center.y;
        
        //  计算斜边长度
        CGFloat distance = hypot(offsetX, offsetY);
        
        //  计算角度
        CGFloat angle = atan2(offsetY, offsetX);
        
        // MARK: - 设置推力的大小和方向
        // 力度,量级
        self.push.magnitude = distance;
        // 方向
        self.push.angle = angle;
        // MARK: - 生效!!! 设置active,让单次推动生效
        self.push.active = YES;
        
        
        
        //  拖拽结束后,让线隐藏
        self.loc = CGPointZero;         //起点和终点都设置为0
        self.currentP = CGPointZero;
        
        //  小图标隐藏
        self.attView.hidden = YES;
        
        //  重绘
        [self setNeedsDisplay];
        
    }
    
}



#pragma mark: - 绘制方法
- (void)drawRect:(CGRect)rect {
    
    //  创建路径对象
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //  设置起点
    [path moveToPoint:self.loc];
    
    //  设置终点
    [path addLineToPoint:self.currentP];
    
    //  线宽和线头样式及颜色的设置
    [[UIColor grayColor] setStroke];
    path.lineWidth = 5;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineCapStyle = kCGLineJoinRound;
    
    //  绘制
    [path stroke];
}



@end
