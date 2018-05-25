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
    @IBOutlet weak var labelButton: UIButton!
    @IBOutlet weak var fadeButton: UIButton!
    @IBOutlet weak var labelFadeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultButton.layer.borderWidth = 1
        defaultButton.layer.borderColor = UIColor.white.cgColor
        defaultButton.layer.cornerRadius = 4
        
        labelButton.layer.borderWidth = 1
        labelButton.layer.borderColor = UIColor.white.cgColor
        labelButton.layer.cornerRadius = 4
        
        fadeButton.layer.borderWidth = 1
        fadeButton.layer.borderColor = UIColor.white.cgColor
        fadeButton.layer.cornerRadius = 4
        
        labelFadeButton.layer.borderWidth = 1
        labelFadeButton.layer.borderColor = UIColor.white.cgColor
        labelFadeButton.layer.cornerRadius = 4
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view)
        }
    }
    
    @IBAction func colorPressed(_ sender: Any) {
        CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, labelText: "Creating user account")
        CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view, delay: 1.5)
    }
    
    @IBAction func fadePressed(_ sender: UIButton) {
        CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, animated: true, duration: 0.5)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view, animated: true, duration: 2.0)
        }
    }
    
    @IBAction func labelFadePressed(_ sender: UIButton) {
        CustomActivityIndicator.shared.showActivityIndicator(uiView: self.view, labelText: "Doing something", animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            CustomActivityIndicator.shared.hideActivityIndicator(uiView: self.view, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

