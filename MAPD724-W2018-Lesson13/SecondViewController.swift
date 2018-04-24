import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var secondScreenLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //nextButton.isHidden = true
        //backButton.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //animateButtonsInWithKeyFrames()
        animateButtonsIn()
        animateLabelIn()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: SegueManager.StartView, sender: sender)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        performSegue(withIdentifier: SegueManager.EndView, sender: sender)
    }
    
    
    func animateButtonsIn() {
        let endingCenterNextButton = self.backButton.center
        UIView.animate(withDuration: AnimationManager.duration, animations: {
            self.backButton.center = self.nextButton.center
        })
        
        UIView.animate(withDuration: AnimationManager.duration, animations: {
            self.nextButton.center = endingCenterNextButton
        })
    }
    
    func animateButtonsInWithKeyFrames() {
    
        //AnimationManager.AnimateButtonIn(button: nextButton, options: [.curveEaseInOut])
        //AnimationManager.AnimateButtonIn(button: backButton, options: [.curveEaseInOut])
        
        //let dx: CGFloat = 50.0
        let dy: CGFloat = 100.0
        //let movePoint = CGPoint(x: dx, y: dy)
        let nextStartingPoint = CGPoint(x: nextButton.frame.midX, y:nextButton.frame.midY)
        let backEndingPoint = nextStartingPoint
        
        let backStartingPoint = CGPoint(x: backButton.frame.midX, y: nextButton.frame.midY)
        let nextEndingPoint = backStartingPoint
        let controlPoint = CGPoint(x: (backButton.frame.midX + nextButton.frame.midX)/2, y: nextButton.frame.midY - dy)
        //let point = CGPoint(x: 250, y: 200)
        
        
        let keyFrameAnimation = CAKeyframeAnimation(keyPath:"position")
        let mutablePath = CGMutablePath()
        mutablePath.move(to: nextStartingPoint)
        mutablePath.addQuadCurve(to: nextEndingPoint, control: controlPoint)
        keyFrameAnimation.path = mutablePath
        keyFrameAnimation.duration = AnimationManager.duration
        keyFrameAnimation.fillMode = kCAFillModeForwards
        keyFrameAnimation.isRemovedOnCompletion = false
        
        
        self.nextButton.layer.add(keyFrameAnimation, forKey:"animation")
        
        let backKeyFrameAnimation = CAKeyframeAnimation(keyPath:"position")
        let backMutablePath = CGMutablePath()
        backMutablePath.move(to: backStartingPoint)
        backMutablePath.addQuadCurve(to: backEndingPoint, control: controlPoint)
        backKeyFrameAnimation.path = backMutablePath
        backKeyFrameAnimation.duration = AnimationManager.duration
        backKeyFrameAnimation.fillMode = kCAFillModeForwards
        backKeyFrameAnimation.isRemovedOnCompletion = false
        
        self.backButton.layer.add(backKeyFrameAnimation, forKey:"animation")
    }
    
    func animateLabelIn() {
        UIView.animate(withDuration: AnimationManager.duration, delay: 0.0, options: [.curveEaseOut, .autoreverse, .repeat], animations: {
            self.secondScreenLabel.alpha = 0.0
        }, completion: nil)
        UIView.animate(withDuration: AnimationManager.duration, delay: 0.0, options: [.curveEaseOut], animations: {
            self.secondScreenLabel.center.y = AnimationManager.Top.y
        }, completion: nil)
    }
}
