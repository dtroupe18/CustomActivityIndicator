//
//  CustomActivityIndicator.swift
//  AnatomyShare
//
//  Created by Dave on 1/12/18.
//  Copyright © 2018 Dave. All rights reserved.
//

import UIKit

class CustomActivityIndicator {
    
    // We need to make this a singleton in order for
    // the same views to be added and removed each time
    //
    static let sharedInstance = CustomActivityIndicator()
    
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var label: UILabel = UILabel()
    
    // Show customized activity indicator,
    // actually add activity indicator to passing view
    // @param uiView - add activity indicator to this view
    //
    func showActivityIndicator(uiView: UIView) {
        uiView.isUserInteractionEnabled = false
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor.darkGray
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        activityIndicator.hidesWhenStopped = true
        
        DispatchQueue.main.async {
            self.loadingView.addSubview(self.activityIndicator)
            uiView.addSubview(self.loadingView)
            self.activityIndicator.startAnimating()
        }
    }
    
    // Show customized activity indicator,
    // actually add activity indicator to passing view
    // @param uiView - add activity indicator to this view
    // @param color (optional) - color for the background of the activity indicator
    //
    func showActivityIndicator(uiView: UIView, color: UIColor?) {
        uiView.isUserInteractionEnabled = false
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = color ?? UIColor.darkGray
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        activityIndicator.hidesWhenStopped = true
        
        DispatchQueue.main.async {
            self.loadingView.addSubview(self.activityIndicator)
            uiView.addSubview(self.loadingView)
            self.activityIndicator.startAnimating()
        }
    }
    
    // Show customized activity indicator,
    // actually add activity indicator to passing view
    // @param uiView - add activity indicator to this view
    // @param color - color for the background of the activity indicator
    // @param size - desired size of the activity indicator
    //
    func showActivityIndicator(uiView: UIView, color: UIColor?, size: Double) {
        uiView.isUserInteractionEnabled = false
        loadingView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        loadingView.center = uiView.center
        loadingView.backgroundColor = color ?? UIColor.darkGray
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: size / 2, height: size / 2)
        activityIndicator.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        activityIndicator.hidesWhenStopped = true
        
        DispatchQueue.main.async {
            self.loadingView.addSubview(self.activityIndicator)
            uiView.addSubview(self.loadingView)
            self.activityIndicator.startAnimating()
        }
    }
    
    // Show customized activity indicator,
    // actually add activity indicator to passing view
    // @param uiView - add activity indicator to this view
    // @param color (optional) - color for the background of the activity indicator
    // @param size - desired size of the activity indicator
    //
    func showActivityIndicator(uiView: UIView, color: UIColor?, labelText: String) {
        uiView.isUserInteractionEnabled = false
        
        let width: CGFloat = labelText.width(withConstrainedHeight: 21.0, font: UIFont.systemFont(ofSize: 17))
        
        // Max width is 200 if width is greater than this we need to create a multi-lined label
        //
        if width > 200 {
            let height: CGFloat = labelText.height(withConstrainedWidth: 200, font: UIFont.systemFont(ofSize: 17))
            loadingView.frame = CGRect(x: 0, y: 0, width: 220, height: 100 + height)
            loadingView.center = uiView.center
            label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: height))
            label.center = CGPoint(x: loadingView.frame.size.width / 2, y: 50 + height)
            label.numberOfLines = 0
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            activityIndicator.center = CGPoint(x: 110, y: 50)
            
        } else {
            loadingView.frame = CGRect(x: 0, y: 0, width: width + 20, height: 100)
            loadingView.center = uiView.center
            label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 21))
            label.center = CGPoint(x: loadingView.frame.size.width / 2, y: 90)
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        }
        
        loadingView.backgroundColor = color ?? UIColor.darkGray
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = labelText
        
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.hidesWhenStopped = true
        
        DispatchQueue.main.async {
            self.loadingView.addSubview(self.label)
            self.loadingView.addSubview(self.activityIndicator)
            uiView.addSubview(self.loadingView)
            self.activityIndicator.startAnimating()
        }
    }
    
    // Hide activity indicator
    // Actually remove activity indicator from its super view
    // @param uiView - remove activity indicator from this view
    //
    func hideActivityIndicator(uiView: UIView) {
        // check to make sure container is a subview before we
        // remove it
        if loadingView.isDescendant(of: uiView) {
            DispatchQueue.main.async {
                uiView.isUserInteractionEnabled = true
                self.activityIndicator.stopAnimating()
                self.loadingView.removeFromSuperview()
            }
        }
    }
    
    // Hide activity indicator
    // Actually remove activity indicator from its super view
    // @param uiView - remove activity indicator from this view
    // @param delay - milliseconds to delay the removal of the activity indicator
    //
    func hideActivityIndicator(uiView: UIView, delay: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            if self.loadingView.isDescendant(of: uiView) {
                uiView.isUserInteractionEnabled = true
                self.activityIndicator.stopAnimating()
                self.loadingView.removeFromSuperview()
            }
        }
    }
    
    // Create UIColor from hex values
    // @param rgbValue - hex color value
    // @param alpha - transparency level
    //
    func UIColorFromHex(rgbValue: UInt32, alpha: Double = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 256.0
        let blue = CGFloat(rgbValue & 0xFF) / 256.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
    }
    
}

// In order to show the activity indicator, call the function from your view controller
// CustomActivityIndicator.sharedInstance.showActivityIndicator(uiView: self.view)

// In order to hide the activity indicator, call the function from your view controller
// CustomActivityIndicator.sharedInstance.hideActivityIndicator(uiView: self.view)



