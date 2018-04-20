
//Project by:
//
//      Kshitij Suthar - 300971838
//      Yash Sompura - 300967186
//      Shivam Shah - 300877523
//


import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet var textLat: UITextField!
    @IBOutlet var textLong: UITextField!
    @IBOutlet var textMagnification: UITextField!
    
    let delta = 6.0
    var defaultLatitude = 43.6532
    var defaultLongitude = -79.3832
    let mapLocation = CLLocationCoordinate2DMake(43.6532, -79.3832)

    @IBOutlet var Map: MKMapView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        textLat.attributedPlaceholder = NSAttributedString(string: "Enter Latitude", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        textLong.attributedPlaceholder = NSAttributedString(string: "Enter Longitude", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        textMagnification.attributedPlaceholder = NSAttributedString(string: "Magnification", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        
        let loc = CLLocationCoordinate2DMake(defaultLatitude,defaultLongitude)
        let span = MKCoordinateSpanMake(delta, delta)
        let reg = MKCoordinateRegionMake(loc, span)
        self.Map.region = reg
        self.Map.setRegion(reg, animated: true)
        
        let defaultAnnotation = MKPointAnnotation()
        defaultAnnotation.coordinate = mapLocation
        defaultAnnotation.title = "Toronto"
        defaultAnnotation.subtitle = "Home"
        self.Map.addAnnotation(defaultAnnotation)
        self.Map.selectAnnotation(defaultAnnotation, animated: true)

    }

    @IBAction func btnSearch(_ sender: Any) {
        
        let lat = Double(self.textLat.text!)
        let long = Double(self.textLong.text!)
        let magnification = Double(self.textMagnification.text!)
        let coordinates = textLat.text! + (",") + textLong.text!
        
        if lat == nil && long == nil {
            let loc = CLLocationCoordinate2DMake(defaultLatitude,defaultLongitude)
            let span = MKCoordinateSpanMake(delta, delta)
            let reg = MKCoordinateRegionMake(loc, span)
            self.Map.region = reg
            
            let defaultAnnotation = MKPointAnnotation()
            defaultAnnotation.coordinate = mapLocation
            defaultAnnotation.title = "Toronto"
            defaultAnnotation.subtitle = "Home"
            self.Map.addAnnotation(defaultAnnotation)
        }
        
        else {
            let coordinateLocation = CLLocationCoordinate2DMake(lat!, long!)
            let loc = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat!), longitude: CLLocationDegrees(long!))
            let span = MKCoordinateSpanMake(CLLocationDegrees(magnification!), CLLocationDegrees(magnification!))
            let reg = MKCoordinateRegionMake(loc, span)
            self.Map.region = reg
            
            let ann = MKPointAnnotation()
            ann.coordinate = coordinateLocation
            ann.title = coordinates
            ann.subtitle = "Coordinate Location"
            self.Map.addAnnotation(ann)
            self.Map.selectAnnotation(ann, animated: true)
        }
        
    }

    
    @IBAction func mapButton(_ sender: UIButton) {
        
        let placemark = MKPlacemark(coordinate: self.Map.centerCoordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = textLat.text! + (",") + textLong.text!
        mapItem.openInMaps(launchOptions: [
            MKLaunchOptionsMapTypeKey: MKMapType.standard.rawValue,
            MKLaunchOptionsMapCenterKey: self.Map.region.center,
            MKLaunchOptionsMapSpanKey: self.Map.region.span
            ])
    }
    
}

