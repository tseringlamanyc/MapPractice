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
        let userLocation = CLLocationCoordinate2D(latitude: Double(persons.location.coordinates.latitude)!, longitude: Double(persons.location.coordinates.longitude)!)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: userLocation, span: span)
            mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = userLocation
        annotation.title = persons.location.city
        annotation.subtitle = persons.location.country
        mapView.addAnnotation(annotation)
     
    }
    
    
    
    
}
