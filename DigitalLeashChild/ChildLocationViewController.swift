//
//  ChildLocationViewController.swift
//  DigitalLeashChild
//
//  Created by Burak Firik on 1/2/18.
//  Copyright © 2018 Burak Firik. All rights reserved.
//

import UIKit
import MapKit
import Alamofire


class ChildLocationViewController: UIViewController, CLLocationManagerDelegate{

  @IBOutlet weak var doneButton: UIButton!
  
  var manager = CLLocationManager()
  var parentID = ""
  override func viewDidLoad() {
        super.viewDidLoad()
        roundCornerButton()
    
    manager.delegate = self
    if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
      manager.startUpdatingLocation()
    } else {
      manager.requestWhenInUseAuthorization()
    }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func roundCornerButton() {
    doneButton.layer.cornerRadius = 10
    doneButton.clipsToBounds = true
  }

  @IBAction func doneButtonTapped(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    if let coordinate = manager.location?.coordinate {
      var locDict: [String: Any] = ["username":parentID,"current_latitude": coordinate.latitude, "current_longitude": coordinate.longitude]
      
      let baseURL = "https://turntotech.firebaseio.com/digitalleash/\(parentID).json"
      let requestUrl = URL(string: baseURL)
      
      Alamofire.request(baseURL, method:.patch, parameters:locDict,encoding: JSONEncoding.default).responseJSON { response in
        switch response.result {
        case .success:
          print(response)
        case .failure(let error):
          print(error)
        }
      }
    }
    
  }
  

}
