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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 4
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        CustomActivityIndicator.sharedInstance.showActivityIndicator(uiView: self.view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            CustomActivityIndicator.sharedInstance.hideActivityIndicator(uiView: self.view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

