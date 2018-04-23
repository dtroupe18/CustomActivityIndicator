//
//  ViewController.swift
//  CustomActivityIndicator
//
//  Created by Dave on 1/24/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var colorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 4
        
        colorButton.layer.borderWidth = 1
        colorButton.layer.borderColor = UIColor.white.cgColor
        colorButton.layer.cornerRadius = 4
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        // Show standard activity indicator
        //
        CustomActivityIndicator.sharedInstance.showActivityIndicator(uiView: self.view, color: nil, labelText: "Loading User Data. Plus some long text for no reason. Adding even more text just to make sure this still works. Up to a height of 200. Which is the max size we will allow. Well that was only 143 height so we need to add more text")
        
        // Now you can pass the desired delay when calling hideActivityIndicator
        //
        CustomActivityIndicator.sharedInstance.hideActivityIndicator(uiView: self.view, delay: 3.0)
    }
    @IBAction func colorPressed(_ sender: Any) {
        // Pass a color and size to the activity indicator
        //
        CustomActivityIndicator.sharedInstance.showActivityIndicator(uiView: self.view, color: UIColor.black, size: 100)
        
        CustomActivityIndicator.sharedInstance.hideActivityIndicator(uiView: self.view, delay: 1.5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

