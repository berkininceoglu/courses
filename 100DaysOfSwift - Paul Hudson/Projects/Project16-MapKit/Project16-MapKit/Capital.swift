//
//  Capital.swift
//  Project16-MapKit
//
//  Created by Berkin İnceoğlu on 17.11.2021.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info : String
    
    
    init(title: String, coordinate: CLLocationCoordinate2D, info : String){
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
