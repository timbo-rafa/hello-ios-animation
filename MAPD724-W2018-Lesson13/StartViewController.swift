import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        performSegue(withIdentifier: SegueManager.SecondView, sender: sender)
    }

}
