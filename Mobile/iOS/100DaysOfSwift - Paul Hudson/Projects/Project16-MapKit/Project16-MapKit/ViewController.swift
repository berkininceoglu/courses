//
//  ViewController.swift
//  Project16-MapKit
//
//  Created by Berkin İnceoğlu on 17.11.2021.
//

import UIKit
import MapKit
import WebKit


class ViewController: UIViewController, MKMapViewDelegate, WKNavigationDelegate{
    @IBOutlet weak var mapView: MKMapView!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        webView = WKWebView()
        webView.navigationDelegate = self
           
        // Do any additional setup after loading the view.
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.50722, longitude: -0.175), info: "Home to the 2012 Summer Olympics")
        
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded thousand years ago")
        
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3708), info: "City of light")
        
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it e.g Vatican")
        
        let washington = Capital(title: "Washington", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "named after george himself")
        
        let istanbul = Capital(title: "Istanbul", coordinate: CLLocationCoordinate2D(latitude: 41.015137, longitude: 28.979530), info: "Where amazing happens!")
        
        mapView.addAnnotations([london,oslo,paris,rome,washington,istanbul])
                
        let ac = UIAlertController(title: "Map Style", message: "Choose a view map type!", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Satellite", style: .default, handler: setMapType))
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: setMapType))
        ac.addAction(UIAlertAction(title: "SatelliteFlyOver", style: .default, handler: setMapType))
        ac.addAction(UIAlertAction(title: "HybridFlyOver", style: .default, handler: setMapType))
        ac.addAction(UIAlertAction(title: "MutedStandard", style: .default, handler: setMapType))
        ac.addAction(UIAlertAction(title: "Standard", style: .default, handler: setMapType))
        present(ac, animated: true)
    }
    
    func setMapType(action: UIAlertAction){
        switch action.title {
        case "Satellite":
            mapView.mapType = .satellite
        case "Hybrid":
            mapView.mapType = .hybrid
        case "SatelliteFlyOver":
            mapView.mapType = .satelliteFlyover
        case "HybridFlyOver":
            mapView.mapType = .hybridFlyover
        case "MutedStandard":
            mapView.mapType = .mutedStandard
        case "Standard":
            mapView.mapType = .standard
        default:
            mapView.mapType = .standard
        }
        
        }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 1
        guard annotation is Capital else { return nil }

        // 2
        let identifier = "Capital"

        // 3
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView

        if annotationView == nil {
            //4
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.pinTintColor = UIColor.yellow

            // 5
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            // 6
            annotationView?.annotation = annotation
        }

        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        let placeName = capital.title
        let placeInfo = capital.info

        
        //let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        //ac.addAction(UIAlertAction(title: "OK", style: .default))
        //present(ac, animated: true)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "webView") as? WebViewController{
            vc.paramUrl = "https://wikipedia.org/wiki/" + placeName!
                    navigationController?.pushViewController(vc, animated: true)
                }
        
    }
    

}

