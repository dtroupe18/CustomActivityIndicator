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
    // Show activity indicator with no animation and no label
    //
    uiView.userInteractionEnabled = NO;
    loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    loadingView.center = uiView.center;
    loadingView.backgroundColor = UIColor.darkGrayColor;
    loadingView.clipsToBounds = YES;
    loadingView.layer.cornerRadius = 10.0;
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    activityIndicator.center = CGPointMake(loadingView.frame.size.width / 2, loadingView.frame.size.width / 2);
    activityIndicator.hidesWhenStopped = YES;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self->loadingView addSubview:self->activityIndicator];
        [uiView addSubview:self->loadingView];
        [self->activityIndicator startAnimating];
    });
}

-(void)show:(UIView *)uiView backgroundColor:(UIColor *)backgroundColor size:(double)size duration:(double)duration {
    // Show activity indicator with backgroundColor, size, and animates for the duration passsed.
    // If you do not want animation use duration = 0.0
    //
    uiView.userInteractionEnabled = NO;
    loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size, size)];
    loadingView.center = uiView.center;
    loadingView.backgroundColor = backgroundColor;
    loadingView.clipsToBounds = YES;
    loadingView.layer.cornerRadius = 10.0;
    loadingView.alpha = 0.0;
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, size/2, size/2)];
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    activityIndicator.center = CGPointMake(loadingView.frame.size.width/2, loadingView.frame.size.width/2);
    activityIndicator.hidesWhenStopped = YES;

    dispatch_async(dispatch_get_main_queue(), ^{
        [self->loadingView addSubview:self->activityIndicator];
        [uiView addSubview:self->loadingView];
        [self->activityIndicator startAnimating];
        
        [UIView animateWithDuration:duration animations:^{
            self->loadingView.alpha = 1.0;
        }];
    });
}

-(void)show:(UIView *)uiView
            backgroundColor:(UIColor *)backgroundColor
            textColor:(UIColor *)textColor
            labelText:(NSString *)labelText
            duration:(double)duration {
    
    // Show activity indicator with background color, text color, label, and animataion
    // Again if you do not want the appearance animated use duration = 0.0
    //
    uiView.userInteractionEnabled = NO;
    label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:15.0];
    label.numberOfLines = 0;
    [label setText:labelText];
    
    CGSize maxSize = CGSizeMake(200.0, 200.0);
    CGSize requiredSize = [label sizeThatFits:maxSize];
    
    NSLog(@"requiredSize.width: %f", requiredSize.width);
    NSLog(@"requiredSize.height: %f", requiredSize.height);
    
    if (requiredSize.width > maxSize.width || requiredSize.height > maxSize.height) {
        // Label is too big
        //
        [self show:uiView backgroundColor:backgroundColor size:80.0 duration:duration];
    } else {
        CGFloat height = requiredSize.height + 100;
        
        NSLog(@"height: %f", height);
        NSLog(@"requiredSize.height: %f", requiredSize.height);
        
        loadingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, requiredSize.width + 30, height)];
        loadingView.center = uiView.center;
        label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, requiredSize.width + 20, requiredSize.height + 18)];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.numberOfLines = 0;
        label.center = CGPointMake(loadingView.frame.size.width / 2, loadingView.frame.size.height - requiredSize.height);
        activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        activityIndicator.center = CGPointMake(loadingView.frame.size.width/2, 50.0);
    }
    
    label.text = labelText;
    [label setTextAlignment:NSTextAlignmentCenter];
    label.textColor = UIColor.whiteColor;
    
    loadingView.backgroundColor = backgroundColor;
    loadingView.clipsToBounds = YES;
    loadingView.layer.cornerRadius = 10.0;
    loadingView.alpha = 0.0;
    
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    activityIndicator.hidesWhenStopped = YES;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"label.width: %f", self->label.frame.size.width);
        NSLog(@"label.height: %f", self->label.frame.size.height);
        [self->loadingView addSubview:self->label];
        [self->loadingView addSubview:self->activityIndicator];
        [uiView addSubview:self->loadingView];
        [self->activityIndicator startAnimating];
        
        [UIView animateWithDuration:duration animations:^{
            self->loadingView.alpha = 1.0;
        }];
    });
}

-(void)hide:(UIView *)uiView {
    if ([loadingView isDescendantOfView:uiView]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            uiView.userInteractionEnabled = YES;
            [self->activityIndicator stopAnimating];
            [self->loadingView removeFromSuperview];
        });
    } else {
        // add a short delay incase hide was called before the view appeared
        //
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            if ([self->loadingView isDescendantOfView:uiView]) {
                uiView.userInteractionEnabled = YES;
                [self->activityIndicator stopAnimating];
                [self->loadingView removeFromSuperview];
            }
        });
    }
}

-(void)hide:(UIView *)uiView duration:(double)duration {
    if ([loadingView isDescendantOfView:uiView]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:duration animations:^{
                self->loadingView.alpha = 0.0;
            } completion:^(BOOL finished) {
                if (finished) {
                    uiView.userInteractionEnabled = YES;
                    [self->activityIndicator stopAnimating];
                    [self->loadingView removeFromSuperview];
                }
            }];
        });
    } else {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            if ([self->loadingView isDescendantOfView:uiView]) {
                [UIView animateWithDuration:duration animations:^{
                    self->loadingView.alpha = 0.0;
                } completion:^(BOOL finished) {
                    if (finished) {
                        uiView.userInteractionEnabled = YES;
                        [self->activityIndicator stopAnimating];
                        [self->loadingView removeFromSuperview];
                    }
                }];
            }
        });
    }
}

@end

