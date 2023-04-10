import UIKit

class ViewController: UIViewController {
    var tapCount = 0

    @IBOutlet var myView: UIView!
    @IBOutlet weak var tapCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 2
        myView.addGestureRecognizer(tapGestureRecognizer)

    }
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        if(sender.numberOfTapsRequired == 1){
            tapCount+=1
            tapCountLabel.text = "\(tapCount)"
        }
        else if(sender.numberOfTapsRequired == 2){
            tapCount = 0
            tapCountLabel.text = "\(tapCount)"
            print("Double Tap")
            self.performSegue(withIdentifier: "showSecond", sender: self)
        }
    }
    
    @IBAction func didLongPress(_ sender: UILongPressGestureRecognizer) {
        if(sender.state.rawValue == 1){
            print("Long Press Detected")
            tapCount = 0
            tapCountLabel.text = "\(tapCount)"
            self.performSegue(withIdentifier: "showThird", sender: self)
        }
        
    }
    
    @IBAction func didPanGesture(_ sender: UIPanGestureRecognizer) {
        if(sender.state.rawValue == 1){
            print("Pan Gesture Detected")
            tapCount = 0
            tapCountLabel.text = "\(tapCount)"
            self.performSegue(withIdentifier: "showForth", sender: self)
        }
    }
}

