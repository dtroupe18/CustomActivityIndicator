//
//  ViewController.swift
//  CustomActivityIndicator
//
//  Created by Dave on 1/24/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var defaultButton: UIButton!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var bottomLabelButton: UIButton!
    @IBOutlet weak var topLabelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultButton.layer.borderWidth = 1
        defaultButton.layer.borderColor = UIColor.white.cgColor
        defaultButton.layer.cornerRadius = 4
        
        colorButton.layer.borderWidth = 1
        colorButton.layer.borderColor = UIColor.white.cgColor
        colorButton.layer.cornerRadius = 4
        
        bottomLabelButton.layer.borderWidth = 1
        bottomLabelButton.layer.borderColor = UIColor.white.cgColor
        bottomLabelButton.layer.cornerRadius = 4
        
        topLabelButton.layer.borderWidth = 1
        topLabelButton.layer.borderColor = UIColor.white.cgColor
        topLabelButton.layer.cornerRadius = 4
    }
    
    @IBAction func defaultButtonPressed(_ sender: UIButton) {
        // Show standard activity indicator
        //
        CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view)
        
        // Now you can pass the desired delay when calling hideActivityIndicator
        //
        CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view, delay: 1.5)
    }
    
    @IBAction func colorPressed(_ sender: Any) {
        // Pass a color and size to the activity indicator
        //
        CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, backgroundColor: UIColor.black, size: 100)
        
        CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view, delay: 1.5)
    }
    
    @IBAction func bottomLabelButtonPressed(_ sender: UIButton) {
        CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, backgroundColor: nil, labelText: "Uploading your information.", textColor: nil)
        CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view, delay: 1.5)
    }
    
    @IBAction func topLabelButtonPressed(_ sender: UIButton) {
        CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, backgroundColor: nil, labelText: "Creating user account", textColor: UIColor.red)
        CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view, delay: 1.5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

