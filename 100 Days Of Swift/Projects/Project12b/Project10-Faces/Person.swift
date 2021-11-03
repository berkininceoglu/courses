//
//  Person.swift
//  Project10-Faces
//
//  Created by Berkin İnceoğlu on 28.10.2021.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String){
        self.name = name
        self.image = image
    }
}
