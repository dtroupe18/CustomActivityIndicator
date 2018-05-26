//
//  ViewController.m
//  CustomActivityIndicator
//
//  Created by Dave on 5/25/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

#import "ViewController.h"
#import "CustomActivityIndicator.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.defaultButton.layer.borderWidth = 1.0;
    self.defaultButton.layer.borderColor = UIColor.whiteColor.CGColor;
    self.defaultButton.layer.cornerRadius = 4.0;
    
    self.animateButton.layer.borderWidth = 1.0;
    self.animateButton.layer.borderColor = UIColor.whiteColor.CGColor;
    self.animateButton.layer.cornerRadius = 4.0;
    
    self.labelButton.layer.borderWidth = 1.0;
    self.labelButton.layer.borderColor = UIColor.whiteColor.CGColor;
    self.labelButton.layer.cornerRadius = 4.0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showPressed:(id)sender {
    [CustomActivityIndicator.shared show:self.view];
    [CustomActivityIndicator.shared show:self.view backgroundColor:UIColor.darkGrayColor size:80.0 duration:1.0];
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [CustomActivityIndicator.shared hide:self.view];
    });
}

- (IBAction)showLabelPressed:(id)sender {
    [CustomActivityIndicator.shared show:self.view backgroundColor:UIColor.darkGrayColor textColor:UIColor.whiteColor labelText:@"Loading user data" duration:1.0];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [CustomActivityIndicator.shared hide:self.view duration:1.0];
    });
}

- (IBAction)animatePressed:(id)sender {
    [CustomActivityIndicator.shared show:self.view backgroundColor:UIColor.darkGrayColor size:80.0 duration:1.0];
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [CustomActivityIndicator.shared hide:self.view duration:1.0];
    });
}

@end


