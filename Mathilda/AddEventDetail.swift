//
//  AddEventDetail.swift
//  Mathilda
//
//  Created by Yang Li on 26/02/2017.
//  Copyright © 2017 Mathilda. All rights reserved.
//

import UIKit
import CoreLocation

class timeZoneDetailController: UITableViewController, CLLocationManagerDelegate {
  let locationManager = CLLocationManager()
  let timeZoneDetailView = UITableView()
  func getLocation() {
    let status = CLLocationManager.authorizationStatus()
    if status == .notDetermined {
      locationManager.requestWhenInUseAuthorization()
      return
    }
    if status == .denied || status == .restricted {
      let locationAlert = UIAlertController(title: "Location Services Disabled", message: "Please enable Location Services in Settings", preferredStyle: .alert)
      locationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      present(locationAlert, animated: true, completion: nil)
      return
    }
    locationManager.delegate = self
    locationManager.startUpdatingLocation()
  }
  @nonobjc func locationManager(_ manager: CLLocationManager, didUpdateHeading locations: [CLLocation]) {
    let currentLocation = locations.last!
    print("Current location: \(currentLocation)")
  }
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Error \(error)")
  }
}
