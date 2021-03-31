//
//  MapViewController.swift
//  Some
//
//  Created by Emilia Nedyalkova on 25.03.21.
//

import UIKit
import MapKit

extension MKMapView {
    func setInitialLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        self.setRegion(coordinateRegion, animated: false)
    }
}

class MapViewController: UIViewController {
    var mapView: MKMapView!
    var pointsOfInterestLabel: UILabel!
    var pointsSwitch: UISwitch!
    
    let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
    
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
        // Map
        mapView = MKMapView()
        view = mapView
        mapView.setInitialLocation(initialLocation)
        
        // Label
        pointsOfInterestLabel = UILabel()
        pointsOfInterestLabel.text = "Points of Interest"
        pointsOfInterestLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointsOfInterestLabel)
        
        // Switch
        pointsSwitch = UISwitch()
        pointsSwitch.setOn(true, animated: false)
        pointsSwitch.addTarget(self, action: #selector(toggleSwitchPoints(_:)), for: .valueChanged)
        pointsSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointsSwitch)
        
        // Segmented Control
        let segmentedControl = UISegmentedControl(items: segmentItems.map { $0.name })
        
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self,
                                   action: #selector(mapTypeChanged(_:)),
                                   for: .valueChanged)
        view.addSubview(segmentedControl)
        
        // Constraints Segmented Control
        let margins = view.layoutMarginsGuide
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        // Label Constraints
        let labelTopConstraint = pointsOfInterestLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
        let labelLeadingConstraint = pointsOfInterestLabel.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
        
        labelTopConstraint.isActive = true
        labelLeadingConstraint.isActive = true
        
        // Switch Constraints
        let switchTopConstraint = pointsSwitch.centerYAnchor.constraint(equalTo: pointsOfInterestLabel.centerYAnchor)
        let switchLeadingConstraint = pointsSwitch.leadingAnchor.constraint(equalTo: pointsOfInterestLabel.trailingAnchor, constant: 8)
        
        switchTopConstraint.isActive = true
        switchLeadingConstraint.isActive = true
    }
    
    @objc
    func mapTypeChanged(_ segControl: UISegmentedControl) {
        if segmentItems.indices ~= segControl.selectedSegmentIndex {
            mapView.mapType = segmentItems[segControl.selectedSegmentIndex].mapType
        }
    }
    
    @objc
    func toggleSwitchPoints(_ switchControl: UISwitch) {
        mapView.pointOfInterestFilter = switchControl.isOn ? .includingAll : .excludingAll
    }
}
