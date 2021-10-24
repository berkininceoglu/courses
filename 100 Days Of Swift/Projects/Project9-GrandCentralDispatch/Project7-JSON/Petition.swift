//
//  Petition.swift
//  Project7-JSON
//
//  Created by Berkin İnceoğlu on 19.10.2021.
//

import Foundation

struct Petition : Codable{
    var title: String
    var body: String
    var signatureCount: Int
}
