# Custom Activity Indicator 
An activity indicator written in Swift 4 that doesn't take up the whole screen.


## Usage
In order to show the activity indicator, call the function from your view controller

```swift
CustomActivityIndicator.sharedInstance.showActivityIndicator(uiView: self.view)
```

### You can also pass a background color as well as a size
```swift
CustomActivityIndicator.sharedInstance.showActivityIndicator(uiView: self.view, color: UIColor.black, size: 100)
```

In order to hide the activity indicator, call the function from your view controller

```swift
CustomActivityIndicator.sharedInstance.hideActivityIndicator(uiView: self.view)
```

### You can also pass a delay

```swift
CustomActivityIndicator.sharedInstance.hideActivityIndicator(uiView: self.view, delay: 1.5)
```

If showActivityIndicator and hideActivityIndicator are called in rapid succession this activity indicator might not be removed from the current view. You can fix this by providing a slight delay for instances where this might apply (a task that could immediately fail for example).

```swift

DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
    CustomActivityIndicator.sharedInstance.hideActivityIndicator(uiView: self.view)
}

```

**Sample Image**  
  
  ![Alt Text](https://github.com/dtroupe18/CustomActivityIndicator/blob/master/ReadMe/screenShot.PNG)

  
**Sample Animation**
  
  ![Alt Text](https://github.com/dtroupe18/CustomActivityIndicator/blob/master/ReadMe/indicator.gif)
  
