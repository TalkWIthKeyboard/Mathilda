//
//  AddEventDetail.swift
//  Mathilda
//
//  Created by Yang Li on 26/02/2017.
//  Copyright © 2017 Mathilda. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class addEventDetail: UIViewController, CLLocationManagerDelegate {
  let locationManager = CLLocationManager()
  let timeZoneDetailView = UITableView()
  
  override func viewWillAppear(_ animated: Bool) {
    getLocation()
    let mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
    view.addSubview(mapView)
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
  }
  
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

