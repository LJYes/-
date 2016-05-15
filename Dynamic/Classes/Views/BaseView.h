//
//  BaseView.h
//  Dynamic
//
//  Created by my young on 16/5/15.
//  Copyright © 2016年 lijiongjiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

//  仿真者元素
@property (weak, nonatomic) UIImageView *boxView; 

//  拖动的元素
@property (weak, nonatomic) UIImageView *attView; 

//  仿真者
@property (strong, nonatomic) UIDynamicAnimator *dynam;

@end
