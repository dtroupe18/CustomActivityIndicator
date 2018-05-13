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
        CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view)
        CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view, delay: 1.5)
    }
    
    @IBAction func colorPressed(_ sender: Any) {
        CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, labelText: "Creating user account")
        CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view, delay: 1.5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

