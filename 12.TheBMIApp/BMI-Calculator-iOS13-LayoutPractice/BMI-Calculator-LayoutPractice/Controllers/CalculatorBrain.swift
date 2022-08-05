import Foundation
import UIKit

struct CalculatorBrain {
    var bmiValue : BMI?
    
    mutating func calculateBmi(height : Float, weight : Float) {
        let bmiValueTemp = round(weight/pow(height,2)*100)/100
        switch bmiValueTemp {
        case let x where x < 18.5:
            bmiValue = BMI(value: bmiValueTemp, advice: "U SHOULD EAT MY DICK!", color: .blue)
        case let x where x < 24.9:
            bmiValue = BMI(value: bmiValueTemp, advice: "NO CAP U R FIRING IT!", color: .green)
        case let x where x < 29.9:
            bmiValue = BMI(value: bmiValueTemp, advice: "YO! EAT LESS DICK MATE!", color: .yellow)
        case let x where x < 34.9:
            bmiValue = BMI(value: bmiValueTemp, advice: "OMG! GO TO SHIT DUDE!", color: .orange)
        case let x where x < 39.9:
            bmiValue = BMI(value: bmiValueTemp, advice: "OH DAMN, HOPE U DONT DIE!", color: .red)
        default:
            bmiValue = BMI(value: bmiValueTemp, advice: "JESUS CRIST, U ABOUT 2 DIE MA MAN!", color: .black)
        }
    }
    
    func getBmiValue() -> String {
        return String(bmiValue?.value ?? 0.0)
    }
    func getBmiColor() -> UIColor {
        return bmiValue?.color ?? .red
    }
    func getBmiAdvice() -> String {
        return bmiValue?.advice ?? "nothing"
    }
}
