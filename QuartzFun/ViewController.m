//
//  ViewController.m
//  QuartzFun
//
//  Created by 李懿哲 on 5/29/16.
//  Copyright © 2016 李懿哲. All rights reserved.
//

#import "ViewController.h"
#import "LYZQuartzFunView.h"

@interface ViewController ()

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

- (IBAction)changeColor:(id)sender {
    UISegmentedControl *control = sender;
    ColorTabIndex index = [control selectedSegmentIndex];
    LYZQuartzFunView *funView = (LYZQuartzFunView *)self.view;
    switch (index) {
        case kRedColorTab:
            funView.currentColor = [UIColor redColor];
            funView.useRandomColor = NO;
            break;
    case kBlueColorTab:
        funView.currentColor = [UIColor blueColor];
        funView.useRandomColor = NO;
        break;
        case kYelloColorTab:
            funView.currentColor = [UIColor yellowColor];
            funView.useRandomColor = NO;
            break;
        case kGreenColorTab:
            funView.currentColor = [UIColor greenColor];
            funView.useRandomColor = NO;
            break;
        case kRandomColorTab:
            funView.useRandomColor = YES;
            break;


        default:
            break;
    }
}

- (IBAction)changeShape:(id)sender {
    UISegmentedControl *control = sender;
    
    [(LYZQuartzFunView *)self.view setShapeType:[control selectedSegmentIndex]];
    if ([control selectedSegmentIndex] == kImageShape) {
        self.colorControl.enabled = NO;
    }else{
        self.colorControl.enabled = YES;
    }
}


@end
