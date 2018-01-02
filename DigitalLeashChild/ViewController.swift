//
//  ViewController.swift
//  DigitalLeashChild
//
//  Created by Burak Firik on 1/2/18.
//  Copyright © 2018 Burak Firik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var reportLocationButton: UIButton!
  
  @IBOutlet weak var parentIDTextField: UITextField!
  
  @IBOutlet weak var parentTextField: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    roundCornerButton()
  }

  @IBAction func reportLocationButtonTapped(_ sender: Any) {
    
    performSegue(withIdentifier: "childViewSegue", sender: nil)
    
  }
  func roundCornerButton() {
    reportLocationButton.layer.cornerRadius = 10
    reportLocationButton.clipsToBounds = true
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let childVC = segue.destination as? ChildLocationViewController {
      if let parentId = parentIDTextField.text {
        childVC.parentID = parentId
      }
    }
  }
  
  
}

