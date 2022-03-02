//
//  View1.m
//  TabBarDemo_mine
//
//  Created by yl on 2022/3/2.
//

#import "View1.h"

@implementation View1

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        // 设置 BNRHypnosisView对象的背景颜色为透明
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
    // 根据bounds计算中心点
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.height/2.0;
    
    // 使最外层圆形成为视图的外接圆
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    // 定义路径
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        // 移除横线:抬起笔移动到下一个圆的起始处
        [path moveToPoint:CGPointMake(center.x+currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI*1.5 clockwise:YES];
    }
    
    // 设置线条颜色
    [[UIColor lightGrayColor] setStroke];
    
    // 设置线条宽度为10
    path.lineWidth = 10.0;
    
    // 绘制路径
    [path stroke];
    
    // 创建图像
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    [logoImage drawInRect:CGRectMake(80, 100, bounds.size.width-160, bounds.size.height-200)];
    
    
}

@end
