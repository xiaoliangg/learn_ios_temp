//
//  ReminderViewController.m
//  TabBarDemo_mine
//
//  Created by yl on 2022/3/2.
//

#import "ReminderViewController.h"

@interface ReminderViewController()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ReminderViewController

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a remember for %@",date);
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        // 设置标签项的标题
        self.tabBarItem.title = @"Reminder";
        
        // 从图像文件创建一个UIImage对象
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        self.tabBarItem.badgeColor = [UIColor yellowColor];
        
        // 将UIImage对象赋给标签项的image属性
        self.tabBarItem.image = i;
        
    }
    return self;
}

@end
