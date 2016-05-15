//
//  DemoController.h
//  Dynamic
//
//  Created by my young on 16/5/15.
//  Copyright © 2016年 lijiongjiong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    kSnapView,       //  吸附
    kPushView,       //  推动
    kAttachmentView, //  刚性
    kSpringView,     //  弹性
    kCollisionView   //  碰撞
    
} KDomeTepy;

@interface DemoController : UIViewController

@property (assign, nonatomic) KDomeTepy dome; 

@end
