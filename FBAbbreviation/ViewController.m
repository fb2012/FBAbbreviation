//
//  ViewController.m
//  FBAbbreviation
//
//  Created by FBI on 17/4/28.
//  Copyright © 2017年 fengbing. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+FBAbbreviation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(60, 300, 300, 60)];
    lbl.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:lbl];
    lbl.lineBreakMode=NSLineBreakByWordWrapping;
    lbl.numberOfLines=2;
    lbl.textAlignment=NSTextAlignmentLeft;
    lbl.text=@"你咋不上天呢阿斯顿话费卡上的发丝客服哈说的理科生发动机啊稅开放死了快点放假哈说的法拉萨激发斯库拉多夫好";
    lbl.font=[UIFont systemFontOfSize:16];
    [lbl setLineReakByTruncatingLastDistance:lbl.frame.size.width/2.0 andString:@"***"];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
