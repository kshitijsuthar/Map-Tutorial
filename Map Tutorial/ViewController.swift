//
//  ViewController.swift
//  Map Tutorial
//
//  Created by Kshitij Suthar on 2018-04-16.
//  Copyright © 2018 Kshitij Suthar. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    let delta = 10.0
    var lat = 43.6532
    var long = -79.3832
    let mapLocation = CLLocationCoordinate2DMake(43.6532, -79.3832)

    @IBOutlet var Map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loc = CLLocationCoordinate2DMake(lat, long)
        let span = MKCoordinateSpanMake(delta, delta)
        let reg = MKCoordinateRegionMake(loc, span)
        self.Map.region = reg
        
        let ann = MKPointAnnotation()
        ann.coordinate = self.mapLocation
        ann.title = "Toronto"
        ann.subtitle = "Home"
        self.Map.addAnnotation(ann)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mapButton(_ sender: UIButton) {
        
        let placemark = MKPlacemark(coordinate: self.mapLocation, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "An awesome place"
        mapItem.openInMaps(launchOptions: [
            MKLaunchOptionsMapTypeKey: MKMapType.standard.rawValue,
            MKLaunchOptionsMapCenterKey: self.Map.region.center,
            MKLaunchOptionsMapSpanKey: self.Map.region.span
            ])
    }
    
}

