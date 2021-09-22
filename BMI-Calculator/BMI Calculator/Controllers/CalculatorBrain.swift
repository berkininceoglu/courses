//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Berkin İnceoğlu on 22.09.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain{
    var bmiValue : Float? = nil
    
    mutating func calculateBMI(height: Float, weight: Float)
    {
        bmiValue = weight / pow(height, 2)
    }
    
    func getBMIValue() ->String{
        return NSString(format: "%.2f", bmiValue!) as String
    }
}
