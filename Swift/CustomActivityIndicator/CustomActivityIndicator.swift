//
//  CustomActivityIndicator.swift
//  AnatomyShare
//
//  Created by Dave on 1/12/18.
//  Copyright © 2018 Dave. All rights reserved.
//

import UIKit

final class CustomActivityIndicator {
    
    // We need to make this a singleton in order for
    // the same views to be added and removed each time
    //
    static let shared = CustomActivityIndicator()
    
    // Init is private so another instance of this class cannot be created
    //
    private init() {}
    
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var label: UILabel = UILabel()
    
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
                               duration: Double = 1.0) {
        
        uiView.isUserInteractionEnabled = false
        loadingView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        loadingView.center = uiView.center
        loadingView.backgroundColor = backgroundColor
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        if animated {
            // Set alpha to allow fading in / out
            loadingView.alpha = 0.0
        } else {
            loadingView.alpha = 1.0
        }
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: size / 2, height: size / 2)
        activityIndicator.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        activityIndicator.hidesWhenStopped = true
        
        DispatchQueue.main.async {
            self.loadingView.addSubview(self.activityIndicator)
            uiView.addSubview(self.loadingView)
            self.activityIndicator.startAnimating()
            if animated {
                // Animate the appearance
                self.loadingView.fadeIn(duration: duration)
            }
        }
    }
    
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
                               duration: Double = 1.0) {
        
        uiView.isUserInteractionEnabled = false
        let width: CGFloat = labelText.width(withConstrainedHeight: 21.0, font: UIFont.systemFont(ofSize: 17))
        
        // Max width is 200 if width is greater than this we need to create a multi-lined label
        //
        if width > 200 {
            let height: CGFloat = labelText.height(withConstrainedWidth: 200, font: UIFont.systemFont(ofSize: 17))
            if height > 200 {
                // Too Large just show a regular indicator
                //
                showActivityIndicator(uiView: uiView, backgroundColor: backgroundColor)
                return
            }
            loadingView.frame = CGRect(x: 0, y: 0, width: 220, height: 110 + height)
            loadingView.center = uiView.center
            label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: height))
            label.center = CGPoint(x: loadingView.frame.size.width / 2, y: (height / 2) + 80)
            label.numberOfLines = 0
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            activityIndicator.center = CGPoint(x: 110, y: 50)
            
        } else {
            loadingView.frame = CGRect(x: 0, y: 0, width: width + 20, height: 110)
            loadingView.center = uiView.center
            label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 21))
            label.center = CGPoint(x: loadingView.frame.size.width / 2, y: 90)
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        }
        
        loadingView.backgroundColor = backgroundColor
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = labelText
        
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.hidesWhenStopped = true
        
        if animated {
            // Set alpha to allow fading in / out
            loadingView.alpha = 0.0
        } else {
            loadingView.alpha = 1.0
        }
        
        DispatchQueue.main.async {
            self.loadingView.addSubview(self.label)
            self.loadingView.addSubview(self.activityIndicator)
            uiView.addSubview(self.loadingView)
            self.activityIndicator.startAnimating()
            if animated {
                // Animate the appearance
                self.loadingView.fadeIn(duration: duration)
            }
        }
    }
    
    // Hide activity indicator
    // Actually remove activity indicator from its super view
    // @param uiView - remove activity indicator from this view
    // @parm animated - Bool animate the appearance (fade in / out)
    // @parm duration - Length of time for the animation
    //
    func hideActivityIndicator(uiView: UIView, animated: Bool = false, duration: Double = 1.0) {
        // check to make sure container is a subview before we
        // remove it
        if loadingView.isDescendant(of: uiView) {
            DispatchQueue.main.async {
                if animated {
                    // Fade the activity indicator out
                    UIView.animate(withDuration: duration, animations: {
                        self.loadingView.alpha = 0.0
                    }, completion: { finished in
                        if finished {
                            uiView.isUserInteractionEnabled = true
                            self.activityIndicator.stopAnimating()
                            self.loadingView.removeFromSuperview()
                            self.label.text = ""
                        }
                    })
                } else {
                    uiView.isUserInteractionEnabled = true
                    self.activityIndicator.stopAnimating()
                    self.loadingView.removeFromSuperview()
                    self.label.text = ""
                }
            }
        } else {
            // Wait a little bit and check again. Hide could have been called before the original indicator appeared
            //
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                if self.loadingView.isDescendant(of: uiView) {
                    if animated {
                        // Fade the activity indicator out
                        UIView.animate(withDuration: duration, animations: {
                            self.loadingView.alpha = 0.0
                        }, completion: { finished in
                            if finished {
                                uiView.isUserInteractionEnabled = true
                                self.activityIndicator.stopAnimating()
                                self.loadingView.removeFromSuperview()
                                self.label.text = ""
                            }
                        })
                    } else {
                        uiView.isUserInteractionEnabled = true
                        self.activityIndicator.stopAnimating()
                        self.loadingView.removeFromSuperview()
                        self.label.text = ""
                    }
                }
            }
        }
    }
    
    // Hide activity indicator
    // Actually remove activity indicator from its super view
    // @param uiView - remove activity indicator from this view
    // @param delay - milliseconds to delay the removal of the activity indicator
    // @parm animated - Bool animate the appearance (fade in / out)
    // @parm duration - Length of time for the animation
    //
    func hideActivityIndicator(uiView: UIView, delay: Double, animated: Bool = false, duration: Double = 1.0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            if self.loadingView.isDescendant(of: uiView) {
                if animated {
                    // Fade the activity indicator out
                    UIView.animate(withDuration: duration, animations: {
                        self.loadingView.alpha = 0.0
                    }, completion: { finished in
                        if finished {
                            uiView.isUserInteractionEnabled = true
                            self.activityIndicator.stopAnimating()
                            self.loadingView.removeFromSuperview()
                            self.label.text = ""
                        }
                    })
                } else {
                    uiView.isUserInteractionEnabled = true
                    self.activityIndicator.stopAnimating()
                    self.loadingView.removeFromSuperview()
                    self.label.text = ""
                }
            }
        }
    }
}

// Sample calls to show indicator
//

// CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view)
// CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, animated: true)
// CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, animated: true, duration: 0.5)
// CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, backgroundColor: .red)
// CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, size: 200)
// CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, backgroundColor: .black, size: 100)
//
// CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, labelText: "Your Text Here")
// CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, labelText: "Your Text Here", backgroundColor: .red)
// CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, labelText: "Your Text Here", textColor: .red)
// CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, labelText: "Your Text Here", backgroundColor: .black, textColor: .red)

// CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view)
// CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view, animated: true)
// CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view, animated: true, duration: 2.0)

extension UIView {
    // Fade in a view with a duration
    func fadeIn(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    // Fade out a view with a duration (Not Used)
    func fadeOut(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
}

// Required extensions to calculate the size of the activity indicator when text for a label is used
//
extension String {
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}
