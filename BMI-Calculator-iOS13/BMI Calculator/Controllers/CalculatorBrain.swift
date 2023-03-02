//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Onur Duyar on 15.02.2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
   mutating func calculateBmi(height: Float, weight: Float){
       let bmiValue = weight / pow(height, 2)
       if bmiValue < 18.5 {
           bmi = BMI(bmiValue: bmiValue, advice: "Eat more pies!", color: .blue)
       } else if bmiValue < 24.9 {
           bmi = BMI(bmiValue: bmiValue, advice: "Fit as a fiddle!", color: .green)
       }
       else {
           bmi = BMI(bmiValue: bmiValue, advice: "Eat less pies!", color: .systemPink)
       }
    }
    
    func getBmiValue() -> String {
        return String(format: "%.1f", bmi?.bmiValue ?? "0.0")
    }
    func getAdvice() -> String {
        bmi?.advice ?? "No advice"
    }
    func getColor() -> UIColor {
        bmi?.color ?? .white
    }
}
