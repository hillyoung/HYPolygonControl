//
//  ViewController.m
//  HYPolygonControl
//
//  Created by yanghaha on 15/12/23.
//  Copyright © 2015年 yanghaha. All rights reserved.
//

#import "ViewController.h"
#import "HYPolygonControl.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchPolgonControl:(HYPolygonControl *)sender {

    NSString *message = @"点击了";

    if (sender.shapeType == HYPolygonTypeRectangle) {
        message = [message stringByAppendingString:@"矩形"];
    } else if (sender.shapeType == HYPolygonTypeOval) {
        message = [message stringByAppendingString:@"椭圆形"];
    } else if (sender.shapeType == HYPolygonTypeMutli) {
        message = [message stringByAppendingString:@"多边形"];
    }

    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

    }];

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示消息"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
