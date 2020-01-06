//
//  MapVC.swift
//  MapPractice
//
//  Created by Tsering Lama on 1/3/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var persons: Result1!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userLat = Double(persons.location.coordinates.latitude)!
        let userLon = Double(persons.location.coordinates.longitude)!
//        let initialLocation = CLLocation(latitude: userLat, longitude: userLon)
//        centerMapOnLocation(location: initialLocation)
        let userLocation = CLLocationCoordinate2D(latitude: userLat, longitude: userLon)
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let region = MKCoordinateRegion(center: userLocation, span: span)
        mapView.setRegion(region, animated: true)
        mapView.isZoomEnabled = false
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: userLat, longitude: userLon)
        annotation.title = persons.location.city
        annotation.subtitle = persons.location.country
        mapView.addAnnotation(annotation)
    }
    
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
    mapView.setRegion(coordinateRegion, animated: true)
    }

    
 
}
