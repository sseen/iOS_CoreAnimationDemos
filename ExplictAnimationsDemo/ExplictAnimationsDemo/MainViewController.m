//
//  MainViewController.m
//  ExplictAnimationsDemo
//
//  Created by sunydea on 14/9/3.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) NSArray *animationString;
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.animationString = @[@"transform.rotation.x",@"transform.rotation.y",@"transform.rotation.z",@"transform.rotation",
          @"transform.scale.x",@"transform.scale.y",@"transform.scale.z",@"transform.scale",
          @"position.x",@"position.y",@"position.z",@"position",
          @"transfrom.translation.x",@"transfrom.translation.y",@"transfrom.translation.z",@"transfrom.translation",];
    
    for (int i=0; i<12; i++) {
        UIButton* bt = [[UIButton alloc] initWithFrame:CGRectMake(20, 70+i*20, 200, 15)];
        bt.backgroundColor = [UIColor purpleColor];
        [bt setTitle:_animationString[i] forState:UIControlStateNormal];
        bt.tag = i;
        [bt addTarget:self action:@selector(btClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:bt];
    }
}

- (void)btClick:(UIButton *)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:_animationString[sender.tag]];
    animation.delegate = self;
    animation.duration = 2;
    animation.repeatCount = 0;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = NO;
    
    switch (sender.tag) {
        case 0:
        case 1:
        case 2:
        case 3:
            animation.byValue = [NSNumber numberWithFloat:M_PI];
            break;
        case 4:
        case 5:
        case 6:
        case 7:
            animation.removedOnCompletion = YES;
            animation.toValue = [NSNumber numberWithFloat:2.0];
            break;
        case 8:
        case 9:
        case 10:
        case 11:
            animation.duration = 2;
            animation.removedOnCompletion = YES;
            animation.toValue = [NSNumber numberWithInt:200];
            break;
        default:
            break;
    }
    [sender.layer addAnimation:animation forKey:nil ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
