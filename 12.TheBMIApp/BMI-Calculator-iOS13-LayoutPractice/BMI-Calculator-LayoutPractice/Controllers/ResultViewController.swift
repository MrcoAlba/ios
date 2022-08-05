import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var RecomendationLabel: UILabel!
    
    var bmiValue : String = "0.0"
    var bmiAdvice : String = ""
    var bmiColour : UIColor = .red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResultLabel.text = bmiValue
        view.backgroundColor = bmiColour
        RecomendationLabel.text = bmiAdvice
    }
    
    @IBAction func RecalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
