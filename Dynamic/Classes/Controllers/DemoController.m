//
//  DemoController.m
//  Dynamic
//
//  Created by my young on 16/5/15.
//  Copyright © 2016年 lijiongjiong. All rights reserved.
//

#import "DemoController.h"
#import "BaseView.h"
#import "SnapView.h"
#import "PushView.h"
#import "AttachmentView.h"
#import "SpringView.h"
#import "CollisionView.h"

@interface DemoController ()

@end

@implementation DemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  判断跳转的控制器
    switch (self.dome) {
        case kSnapView:
          self.view = [[SnapView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            break;
        case kPushView:
            self.view = [[PushView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            break;
        case kAttachmentView:
            self.view = [[AttachmentView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            break;
        case kSpringView:
            self.view = [[SpringView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            break;
        case kCollisionView:
            self.view = [[CollisionView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            break;
            
        default:
            break;
    }
    
//    self.view.backgroundColor = [UIColor yellowColor];
    
}



@end
