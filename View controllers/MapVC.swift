//
//  MapVC.swift
//  MapPractice
//
//  Created by Tsering Lama on 1/3/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var persons: Result1!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLocation()
    }
    
    
    func loadLocation() {
        let userLocation = CLLocation(latitude: Double((persons?.location.coordinates.latitude)!)!, longitude: Double((persons?.location.coordinates.longitude)!)!)
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
      mapView.setRegion(coordinateRegion, animated: true)
    }
   

}
