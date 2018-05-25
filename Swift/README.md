# Custom Activity Indicator 
A custom activity indicator written in Swift 4 that allows for you to set the size, add text, and animate the appearance.


## Usage
Add CustomActivityIndicator.swift to your project

### Sample usage

In order to show the activity indicator call showActivityIndicator from your view controller. Default values are provided for all parameters so you only have to pass the values you want to change. 

Note: If you pass in a string for the label text you cannot set the size of the activity indicator since that will be determined by the length of the string

```swift
// Show customized activity indicator,
// actually add activity indicator to passing view
// @param uiView - add activity indicator to this view
// @param backgroundColor - color for the background of the activity indicator
// @param size - desired size of the activity indicator
// @parm animated - Bool animate the appearance (fade in / out)
// @parm duration - Length of time for the animation
//
func showActivityIndicator(uiView: UIView,
                           backgroundColor: UIColor = .darkGray,
                           size: Double = 80,
                           animated: Bool = false,
                           duration: Double = 1.0)
                           
// Show customized activity indicator,
// actually add activity indicator to passing view
// @param uiView - add activity indicator to this view
// @parm labelText - text to add to activity indicator
// @param backgroundColor - color for the background of the activity indicator
// @param textColor - desired color the the label text
// @parm animated - Bool animate the appearance (fade in / out)
// @parm duration - Length of time for the animation
//                           
func showActivityIndicator(uiView: UIView,
                           labelText: String,
                           backgroundColor: UIColor = .darkGray,
                           textColor: UIColor = .white,
                           animated: Bool = false,
                           duration: Double = 1.0)
```

```swift
 CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view)
 CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, animated: true)
 CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, animated: true, duration: 0.5)
 CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, backgroundColor: .red)
 CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, size: 200)
 CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, backgroundColor: .black, size: 100)

 CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, labelText: "Your Text Here")
 CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, labelText: "Your Text Here", backgroundColor: .red)
 CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, labelText: "Your Text Here", textColor: .red)
 CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, labelText: "Your Text Here", backgroundColor: .black, textColor: .red)
```

In order to hide the activity indicator call hideActivityIndicator from your view controller
```swift
// Hide activity indicator
// Actually remove activity indicator from its super view
// @param uiView - remove activity indicator from this view
// @parm animated - Bool animate the appearance (fade in / out)
// @parm duration - Length of time for the animation
//
func hideActivityIndicator(uiView: UIView, animated: Bool = false, duration: Double = 1.0)

// Hide activity indicator
// Actually remove activity indicator from its super view
// @param uiView - remove activity indicator from this view
// @param delay - milliseconds to delay the removal of the activity indicator
// @parm animated - Bool animate the appearance (fade in / out)
// @parm duration - Length of time for the animation
//
func hideActivityIndicator(uiView: UIView, delay: Double, animated: Bool = false, duration: Double = 1.0)
```

```swift
 CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view)
 CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view, animated: true)
 CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view, animated: true, duration: 2.0)
```
**Samples With Animation**

  ![Alt Text](https://github.com/dtroupe18/CustomActivityIndicator/blob/master/Samples/DefaultWithFade.gif)
  ![Alt Text](https://github.com/dtroupe18/CustomActivityIndicator/blob/master/Samples/LabelWithFade.gif)


**Samples Without Animation**
  
  ![Alt Text](https://github.com/dtroupe18/CustomActivityIndicator/blob/master/Samples/Default.gif)
  ![Alt Text](https://github.com/dtroupe18/CustomActivityIndicator/blob/master/Samples/Label.gif)
  
  
  
  
