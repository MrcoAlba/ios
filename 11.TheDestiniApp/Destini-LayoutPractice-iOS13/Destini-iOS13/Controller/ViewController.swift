import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var LabelText: UILabel!
    @IBOutlet weak var TopButton: UIButton!
    @IBOutlet weak var BottomButton: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        storyBrain.GoToNextStory(sender.currentTitle!)
        UpdateUI()
    }
    
    func UpdateUI(){
        LabelText.text = storyBrain.GetCurrentStoryTitle()
        let options = storyBrain.GetCurrentStoryChoices()
        TopButton.setTitle(options[0] ,for:.normal)
        BottomButton.setTitle(options[1] ,for:.normal)
    }
    
}
