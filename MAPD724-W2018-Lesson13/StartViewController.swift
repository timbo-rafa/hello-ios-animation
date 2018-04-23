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
        AnimateButtonIn()
        MoveButtonOver()
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
    
    func AnimateButtonIn() {
        UIView.transition(with: self.nextButton, duration: 2.0,
            options: [ .transitionFlipFromTop ]
            //.transitionCurlDown]
            , animations: {
            self.nextButton.isHidden = false
        }, completion: nil)
    }

    func MoveButtonOver() {
        UIView.animate(withDuration: 2, delay: 0.25, options: [.curveEaseIn], animations: {
            self.nextButton.center.x += 125
        }, completion: nil)
        
    }
}
