//
//  CustomActivityIndicator.m
//  CustomActivityIndicator
//
//  Created by Dave on 5/25/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomActivityIndicator.h"

@interface CustomActivityIndicator ()

@end

@implementation CustomActivityIndicator

// This class is a singleton. Here we get the shared instance
//
+(CustomActivityIndicator *)shared {
    static CustomActivityIndicator *shared = nil;
    @synchronized(self) {
        if (shared == nil) {
            shared = [[self alloc] init];
        }
    }
    return shared;
}

-(void)show:(UIView *)uiView {
    uiView.userInteractionEnabled = NO;
    
    loadingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    loadingView.center = uiView.center;
    loadingView.backgroundColor = UIColor.darkGrayColor;
    loadingView.clipsToBounds = YES;
    loadingView.layer.cornerRadius = 10.0;
    
    activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    activityIndicator.center = CGPointMake(loadingView.frame.size.width / 2, loadingView.frame.size.width / 2);
    activityIndicator.hidesWhenStopped = YES;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self->loadingView addSubview:self->activityIndicator];
        [uiView addSubview:self->loadingView];
        [self->activityIndicator startAnimating];
    });
}

-(void)hide:(UIView *)uiView {
    if ([loadingView isDescendantOfView:uiView]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            uiView.userInteractionEnabled = YES;
            [self->activityIndicator stopAnimating];
            [self->loadingView removeFromSuperview];
        });
    }
}

@end

