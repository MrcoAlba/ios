import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var FirstButton: UIButton!
    @IBOutlet weak var SecondButton: UIButton!
    @IBOutlet weak var ThirdButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if(quizBrain.CheckAnswer(sender.currentTitle!)){
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(updateUI),
            userInfo: nil,
            repeats: false
        )
    }
    
    @objc func updateUI(){
        scoreLabel.text = "Score: \(quizBrain.GetCurrentScore())"
        questionLabel.text = quizBrain.GetQuestionText()
        SetOptions()
        FirstButton.backgroundColor = UIColor.clear
        SecondButton.backgroundColor = UIColor.clear
        ThirdButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.GetCurrentProgress()
    }
    
    func SetOptions(){
        let options = quizBrain.GetOptions()
        FirstButton.setTitle(options[0], for: .normal)
        SecondButton.setTitle(options[1], for: .normal)
        ThirdButton.setTitle(options[2], for: .normal)
    }
    
}

