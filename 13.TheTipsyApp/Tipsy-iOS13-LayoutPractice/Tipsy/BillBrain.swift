import Foundation

struct BillBrain {

    let tipOptions : [String:Float] = ["0%" : 0.0, "10%" : 0.10, "20%" : 0.20]
    var billValue : Float?
    var tipSelected : String?
    var totalPeople : Int?
    var finalValuePerPerson: Float?
    
    mutating func CalculateFinalValue(bill : Float) {
        billValue = bill
        finalValuePerPerson = 0
        if billValue != nil && tipSelected != nil && totalPeople != nil{
            finalValuePerPerson = Float(Int(billValue! * (1 + tipOptions[tipSelected!]!) / Float(totalPeople!) * 100))/100
        }
    }
    
    func getTipSelected() -> String {
        if tipSelected != nil {
            return tipSelected!
        }
        return "Error!"
    }
    
    func getTotalPeople() -> Int {
        if totalPeople != nil {
            return totalPeople!
        }
        return 0
    }
        
    func getFinalValuePerPerson() -> Float {
        if finalValuePerPerson != nil {
            return finalValuePerPerson!
        }
        return 0.0
    }
}
