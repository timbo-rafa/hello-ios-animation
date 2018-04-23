import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: SegueManager.StartView, sender: sender)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        performSegue(withIdentifier: SegueManager.EndView, sender: sender)
    }
    
}
