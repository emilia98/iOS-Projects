//
//  MapViewController.swift
//  Some
//
//  Created by Emilia Nedyalkova on 25.03.21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
    let segmentItems: [(name: String, mapType: MKMapType)] = [
        ("Standard", .standard),
        ("Hybrid", .hybrid),
        ("Satellite", .satellite)
    ]
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
        let margins = view.layoutMarginsGuide
        let segmentedControl = UISegmentedControl(items: segmentItems.map { $0.name })
        
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self,
                                   action: #selector(mapTypeChanged(_:)),
                                   for: .valueChanged)
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    }
    
    @objc
    func mapTypeChanged(_ segControl: UISegmentedControl) {
        if segmentItems.indices ~= segControl.selectedSegmentIndex {
            mapView.mapType = segmentItems[segControl.selectedSegmentIndex].mapType
        }
    }
}
