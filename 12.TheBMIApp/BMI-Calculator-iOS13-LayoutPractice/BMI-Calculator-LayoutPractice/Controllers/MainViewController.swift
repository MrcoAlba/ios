import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var HeightLabel: UILabel!
    @IBOutlet weak var WeightLabel: UILabel!
    @IBOutlet weak var HeightSlider: UISlider!
    @IBOutlet weak var WeightSlider: UISlider!
    
    var calculator = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func HeightSliderChanged(_ sender: UISlider) {
        HeightLabel.text = "\(round(sender.value*100)/100)m"
    }
    
    @IBAction func WeightSliderChanged(_ sender: UISlider) {
        WeightLabel.text = "\(Int(sender.value))Kg"
    }
    @IBAction func CalculatePressed(_ sender: UIButton) {
        calculator.calculateBmi(height: HeightSlider.value, weight: WeightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculator.getBmiValue()
            destinationVC.bmiColour = calculator.getBmiColor()
            destinationVC.bmiAdvice = calculator.getBmiAdvice()
        }
    }
}
