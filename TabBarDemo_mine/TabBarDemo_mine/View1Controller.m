//
//  View1Controller.m
//  TabBarDemo_mine
//
//  Created by yl on 2022/3/2.
//

#import "View1Controller.h"
#import "View1.h"
@implementation View1Controller

- (void) loadView
{
    // 创建一个BNRHypnosisView对象
    View1 *backgroundView = [[View1 alloc] init];
    
    // 将 BNRHypnosisView 对象赋给视图控制器的view属性
    self.view = backgroundView;
}
@end
