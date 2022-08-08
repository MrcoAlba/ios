import UIKit

class CalculatorViewController: UIViewController {
    
    var billBrain = BillBrain()
    @IBOutlet weak var BillQuantityTextField: UITextField!
    @IBOutlet weak var P00Button: UIButton!
    @IBOutlet weak var P10Button: UIButton!
    @IBOutlet weak var P20Button: UIButton!
    @IBOutlet weak var PeopleQuantityTextView: UILabel!
    @IBOutlet weak var PeopleQuantityStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if P00Button.isSelected {
            billBrain.tipSelected = P00Button.currentTitle
            P10Button.isSelected = false
            P20Button.isSelected = false
        } else if P10Button.isSelected {
            billBrain.tipSelected = P10Button.currentTitle
            P00Button.isSelected = false
            P20Button.isSelected = false
        } else {
            billBrain.tipSelected = P20Button.currentTitle
            P00Button.isSelected = false
            P10Button.isSelected = false
        }
        PeopleQuantityTextView.text = String(PeopleQuantityStepper.value)
        billBrain.totalPeople = Int(PeopleQuantityStepper.value)
        if billBrain.billValue != nil {
            BillQuantityTextField.text = String(billBrain.billValue!)
        }
    }
    
    @IBAction func TipButtonPressed(_ sender: UIButton) {
        P00Button.isSelected = false
        P10Button.isSelected = false
        P20Button.isSelected = false
        sender.isSelected = true
        billBrain.tipSelected = sender.currentTitle
    }
    
    @IBAction func StepperPressed(_ sender: UIStepper) {
        PeopleQuantityTextView.text = String(sender.value)
        billBrain.totalPeople = Int(sender.value)
    }
    
    @IBAction func CalculateButtonPressed(_ sender: UIButton) {
        let bill = Float(BillQuantityTextField.text ?? "") ?? 0
        billBrain.CalculateFinalValue(bill: bill)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = billBrain.getFinalValuePerPerson()
            destinationVC.people = billBrain.getTotalPeople()
            destinationVC.percentage = billBrain.getTipSelected()   
        }
    }
    
    
}
