//
//  Country.swift
//  Day59-Challenge
//
//  Created by Berkin İnceoğlu on 22.11.2021.
//


import Foundation


struct Countries : Codable {
    var results: [Country]
}

struct Country : Codable{
    var title: String
    var body: String
    var signatureCount: Int
}
