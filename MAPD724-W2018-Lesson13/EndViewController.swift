import UIKit

class EndViewController: UIViewController {
    
    @IBOutlet weak var endScreenLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        self.backButton.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        AnimationManager.MoveButtonOver(button: backButton, dx: -125)
        AnimationManager.FlipButtonIn(button: self.backButton, options: [.transitionFlipFromLeft])
        bounceOnEdges()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: SegueManager.SecondView, sender: sender)
    }
 
    func bounceOnEdges() {
        self.endScreenLabel.center  = AnimationManager.Top
        UIView.animateKeyframes(withDuration: 4, delay: 0,
            options: [.repeat, .autoreverse], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                    self.endScreenLabel.center = AnimationManager.Right
                })
                                    
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                    self.endScreenLabel.center = AnimationManager.Bottom
                })
                                    
                UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
                    self.endScreenLabel.center = AnimationManager.Left
                })
                                    
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                    self.endScreenLabel.center = AnimationManager.Top
                })
                
        }, completion: nil)
    }
}
