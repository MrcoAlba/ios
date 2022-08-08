import UIKit

class ResultsViewController: UIViewController {

    var total : Float?
    var people : Int?
    var percentage : String?
    
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var ExplanationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResultLabel.text = String(total!)
        ExplanationLabel.text = "Split between \(people!) people, with \(percentage!) tip."
    }
    
    @IBAction func RecalculateButtonPressed(_ sender: UIButton) {
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
