//
//  BaseView.m
//  Dynamic
//
//  Created by my young on 16/5/15.
//  Copyright © 2016年 lijiongjiong. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
     
        //  设置背景图片
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
        
        // MARK: - 添加子控件
        [self setUp];
        
    }
    return self;
}


#pragma mark - 添加子控件
- (void)setUp {
    //AttachmentPoint_Mask  BackgroundTile  Box1
    
    //  示例方块视图
    UIImageView *boxView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box1"]];
    boxView.frame = CGRectMake(self.bounds.size.width *0.5, self.bounds.size.height *0.2, 100, 100);
    [self addSubview:boxView];
    
    self.boxView = boxView;
    
    //  拖动的点视图
    UIImageView *attView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
    attView.center = CGPointMake(self.center.x, 120);
    attView.hidden = YES;
    [self addSubview:attView];
    
    self.attView = attView;
    
    //  创建仿真者
    UIDynamicAnimator *dynam = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    
    self.dynam = dynam;
    
}

@end
