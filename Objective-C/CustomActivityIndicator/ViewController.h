//
//  ViewController.h
//  CustomActivityIndicator
//
//  Created by Dave on 5/25/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *defaultButton;
@property (weak, nonatomic) IBOutlet UIButton *labelButton;
@property (weak, nonatomic) IBOutlet UIButton *animateButton;

- (IBAction)showPressed:(id)sender;
- (IBAction)showLabelPressed:(id)sender;
- (IBAction)animatePressed:(id)sender;

@end

