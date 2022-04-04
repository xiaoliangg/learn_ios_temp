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

/// nibNameOrNil  指的是nib文件的名字，这里指 ReminderViewController.xib
/// nibBundleOrNil 指的是bundle的名字
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        // 设置标签项的标题
        self.tabBarItem.title = @"Reminder";
        
        // 从图像文件创建一个UIImage对象
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        UIImage *i2 = [UIImage imageNamed:@"Hypno.png"];

        // 将UIImage对象赋给标签项的image属性
        self.tabBarItem.image = i;
        [self.tabBarItem setSelectedImage:i2];
        
    }
    return self;
}

@end
