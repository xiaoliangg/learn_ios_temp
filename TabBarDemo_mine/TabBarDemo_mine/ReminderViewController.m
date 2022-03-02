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

@end
