//
//  CustomActivityIndicator.h
//  CustomActivityIndicator
//
//  Created by Dave on 5/25/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

#ifndef CustomActivityIndicator_h
#define CustomActivityIndicator_h


#endif /* CustomActivityIndicator_h */

#import <UIKit/UIKit.h>

@interface CustomActivityIndicator : NSObject {
    UIView *loadingView;
    UIActivityIndicatorView *activityIndicator;
    UILabel *label;
}

+(CustomActivityIndicator *)shared;
-(void)show: (UIView*)uiView;
-(void)hide: (UIView*)uiView;



@end
