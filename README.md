# Custom Activity Indicator 
A custom activity indicator written in Swift 4 and Objective-C that allows you to set the size, color, add text, and animate the appearance of an activity indicator.

**Samples With Animation**

  ![Alt Text](https://github.com/dtroupe18/CustomActivityIndicator/blob/master/Swift/Samples/DefaultWithFade.gif)
  ![Alt Text](https://github.com/dtroupe18/CustomActivityIndicator/blob/master/Swift/Samples/LabelWithFade.gif)


**Samples Without Animation**
  
  ![Alt Text](https://github.com/dtroupe18/CustomActivityIndicator/blob/master/Swift/Samples/Default.gif)
  ![Alt Text](https://github.com/dtroupe18/CustomActivityIndicator/blob/master/Swift/Samples/Label.gif)


## Swift Usage
Add CustomActivityIndicator.swift to your project

In order to show the activity indicator call show from your view controller. Default values are provided for all parameters so you only have to pass the values you want to change. 

Note: If you pass in a string for the label text you cannot set the size of the activity indicator since that will be determined by the length of the string

### Showing Activity Indicator
```swift
CustomActivityIndicator.shared.show(uiView: self.view)
CustomActivityIndicator.shared.show(uiView: self.view, animated: true)
CustomActivityIndicator.shared.show(uiView: self.view, animated: true, duration: 0.5)
CustomActivityIndicator.shared.show(uiView: self.view, backgroundColor: .red)
CustomActivityIndicator.shared.show(uiView: self.view, size: 200)
CustomActivityIndicator.shared.show(uiView: self.view, backgroundColor: .black, size: 100)
        
CustomActivityIndicator.shared.show(uiView: self.view, labelText: "Your Text Here")
CustomActivityIndicator.shared.show(uiView: self.view, labelText: "Your Text Here", backgroundColor: .red)
CustomActivityIndicator.shared.show(uiView: self.view, labelText: "Your Text Here", textColor: .red)
CustomActivityIndicator.shared.show(uiView: self.view, labelText: "Your Text Here", backgroundColor: .black, textColor: .red)
```

In order to hide the activity indicator call hideActivityIndicator from your view controller. Default values are provided for all parameters so you only have to pass the values you want to change. 

### Hiding Activity Indicator
```swift
CustomActivityIndicator.shared.hide(uiView: self.view)
CustomActivityIndicator.shared.hide(uiView: self.view, animated: true)
CustomActivityIndicator.shared.hide(uiView: self.view, animated: true, duration: 2.0)
```

### Show Function Stubs
```swift
// Show customized activity indicator,
// @param uiView - add activity indicator to this view
// @param backgroundColor - color for the background of the activity indicator
// @param size - desired size of the activity indicator
// @parm animated - Bool animate the appearance (fade in / out)
// @parm duration - Length of time for the animation
//
func show(uiView: UIView,
          backgroundColor: UIColor = .darkGray,
          size: Double = 80,
          animated: Bool = false,
          duration: Double = 1.0)
                           
// Show customized activity indicator,
// @param uiView - add activity indicator to this view
// @parm labelText - text to add to activity indicator
// @param backgroundColor - color for the background of the activity indicator
// @param textColor - desired color for the label text
// @parm animated - Bool animate the appearance (fade in / out)
// @parm duration - Length of time for the animation
//                           
func show(uiView: UIView,
          labelText: String,
          backgroundColor: UIColor = .darkGray,
          textColor: UIColor = .white,
          animated: Bool = false,
          duration: Double = 1.0)
```


### Hide Function Stubs
```swift
// Hide activity indicator
// @param uiView - remove activity indicator from this view
// @parm animated - Bool animate the appearance (fade in / out)
// @parm duration - Length of time for the animation
//
func hide(uiView: UIView, animated: Bool = false, duration: Double = 1.0)

// Hide activity indicator
// @param uiView - remove activity indicator from this view
// @param delay - milliseconds to delay the removal of the activity indicator
// @parm animated - Bool animate the appearance (fade in / out)
// @parm duration - Length of time for the animation
//
func hide(uiView: UIView, delay: Double, animated: Bool = false, duration: Double = 1.0)
```

## Objective-C Usage
Add CustomActivityIndicator.h and CustomActivityIndicator.m to your project.
Import CustomActivityIndicator.h in the view controllers where you want to use the activity indicator 
```objective-c
#import "CustomActivityIndicator.h"
```

In order to show the activity indicator call show from your view controller. 

Note: If you pass in a string for label text you cannot set the size of the activity indicator since that will be determined by the size of the label needed to display the string passed in.

### Showing Activity Indicator
```objective-c
[CustomActivityIndicator.shared show:self.view];
[CustomActivityIndicator.shared show:self.view backgroundColor:UIColor.darkGrayColor size:80.0 duration:1.0];
[CustomActivityIndicator.shared show:self.view backgroundColor:UIColor.darkGrayColor textColor:UIColor.whiteColor labelText:@"Loading user data" duration:1.0];
```

In order to hide the activity indicator call hideActivityIndicator from your view controller.

### Hiding Activity Indicator
```objective-c
[CustomActivityIndicator.shared hide:self.view];
[CustomActivityIndicator.shared hide:self.view duration:1.0];
```

### Show Function Stubs
```objective-c
// Show customized activity indicator,
// @param uiView - view to add activity indicator to
-(void)show: (UIView*)uiView;

// Show customized activity indicator,
// @param uiView - view to add activity indicator to
// @param backgroundColor - color for the background of the activity indicator
// @param size - desired size of the activity indicator
// @parm duration - Length of time for the animation. If you don't want to animate the appearance use 0.0
//
-(void)show: (UIView*)uiView backgroundColor:(UIColor*)backgroundColor size:(double)size duration:(double)duration;

// Show customized activity indicator,
// @param uiView - view to add activity indicator to
// @param backgroundColor - color for the background of the activity indicator
// @param textColor - desired color for the label text 
// @parm labelText - text to add to activity indicator
// @parm duration - Length of time for the animation. If you don't want to animate the appearance use 0.0
//
-(void)show: (UIView*)uiView backgroundColor:(UIColor*)backgroundColor
                      textColor:(UIColor*)textColor labelText:(NSString*)labelText duration:(double)duration;
```


### Hide Function Stubs
```objective-c
// Hide activity indicator
// @param uiView - remove activity indicator from this view
//
-(void)hide: (UIView*)uiView;

// Hide activity indicator
// @param uiView - remove activity indicator from this view
// @parm duration - Length of time for the animation
//
-(void)hide: (UIView*)uiView duration:(double)duration;
```
