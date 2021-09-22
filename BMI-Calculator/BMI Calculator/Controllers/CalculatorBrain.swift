//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Berkin İnceoğlu on 22.09.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    var bmi : BMI? = nil
    
    mutating func calculateBMI(height: Float, weight: Float)
    {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more McDonalds!", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        }
        else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as fiddle!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        }
        else{
            bmi = BMI(value: bmiValue, advice: "Dont eat anymore!", color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        }
    }
    
    func getBMIValue() ->String{
        return NSString(format: "%.2f", bmi?.value ?? "0.0") as String
    }
    
    func getAdvice() ->String{
        return bmi?.advice ?? "You know nothing."
    }
    
    func getColor () ->UIColor{
        return bmi?.color ?? UIColor.black
    }
}
