import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var startScreenLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        startScreenLabel.alpha = 0
        nextButton.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        AnimateLabelIn()
        AnimationManager.FlipButtonIn(button: self.nextButton, options: [ .transitionFlipFromTop])
        AnimationManager.MoveButtonOver(button: self.nextButton, dx: 125 )
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        performSegue(withIdentifier: SegueManager.SecondView, sender: sender)
    }
    
    func AnimateLabelIn() {
        UIView.animate(withDuration: 1, delay: 0.25, options: [.curveEaseInOut], animations: {
            self.startScreenLabel.alpha = 1
            self.startScreenLabel.center.y -= 50
        }, completion: nil)
    }

    func MoveButtonOver() {
        UIView.animate(withDuration: AnimationManager.duration, delay: 0.25, options: [.curveEaseIn, .allowUserInteraction], animations: {
            self.nextButton.center.x += 125
        }, completion: nil)
        
    }
}
