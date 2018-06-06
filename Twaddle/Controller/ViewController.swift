//
//  ViewController.swift
//  Twaddle
//
//  Created by James Campbell on 6/06/18.
//  Copyright © 2018 James Campbell. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    var lat: Double  = 0
    var long: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location.coordinate.latitude)
            lat = location.coordinate.latitude
            long = location.coordinate.longitude
        }
        
        
        
        let geoCoder = CLGeocoder()
        let coordinates = CLLocation(latitude: Double(lat), longitude: Double(long))
        geoCoder.reverseGeocodeLocation(coordinates, completionHandler: { (placemarks, error) -> Void in
            
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            
            // Location name
            if let coordinatesName = placeMark.locality  {
                print(coordinatesName)
            } else {
                print("nope")
            }
        })
        
    }
    
    
}

