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


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        // 设置标签项的标题
        self.tabBarItem.title = @"Hypnotize";
        
        // 从图像文件创建一个UIImage对象
        // 在Retia显示屏上会加载Hypno@2x.png，而不是Hypno.png
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        // 将UIImage对象赋给标签项的image属性
        self.tabBarItem.image = i;
        
    }
    return self;
}
@end
