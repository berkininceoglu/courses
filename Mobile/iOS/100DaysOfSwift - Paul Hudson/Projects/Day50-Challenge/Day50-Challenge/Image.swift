//
//  Image.swift
//  Day50-Challenge
//
//  Created by Berkin İnceoğlu on 4.11.2021.
//

import UIKit

class Image: NSObject, Codable{
    var imageName: String
    var caption: String
    
    init(imageName: String, caption: String){
        self.imageName = imageName
        self.caption = caption
    }
}
