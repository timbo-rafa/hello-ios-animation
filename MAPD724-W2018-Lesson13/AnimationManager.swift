
import CoreGraphics
import UIKit

class AnimationManager {
    // static in swift is class
    
    class var duration: TimeInterval {
        return 1.2
    }
    
    class var screenBounds:CGRect {
        return UIScreen.main.bounds
    }
    
    // Top
    class var Top: CGPoint {
        // TODO: return top value
        return CGPoint(x: screenBounds.midX, y: screenBounds.minY + 20)
    }
    
    class var Right: CGPoint {
        // TODO: return top value
        return CGPoint(x: screenBounds.maxX, y: screenBounds.midY)
    }
    
    class var Bottom: CGPoint {
        // TODO: return top value
        return CGPoint(x: screenBounds.midX, y: screenBounds.maxY)
    }
    
    class var Left: CGPoint {
        // TODO: return top value
        return CGPoint(x: screenBounds.minX, y: screenBounds.midY)
    }
    
    
    class func FlipButtonIn(button: UIButton, options: UIViewAnimationOptions) {
        //UIView.transition(with: <#T##UIView#>, duration: <#T##TimeInterval#>, options: <#T##UIViewAnimationOptions#>, animations: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        UIView.transition(with: button, duration: AnimationManager.duration,
                          options: options
            //.transitionCurlDown]
            , animations: {
                button.isHidden = false
        }, completion: nil)
    }
    
    class func MoveButtonOver(button: UIButton, dx: CGFloat) {
        UIView.animate(withDuration: AnimationManager.duration, delay: 0.25, options: [.curveEaseInOut, .allowUserInteraction], animations: {
            button.center.x += dx
        }, completion: nil)
        
    }
}
