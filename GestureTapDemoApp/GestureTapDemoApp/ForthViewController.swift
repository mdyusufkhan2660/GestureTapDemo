import UIKit

class ForthViewController: UIViewController {
    private let myView: UIView = {
        let myView = UIView()
        myView.backgroundColor = .systemPurple
        return myView
    }()
    private let size: CGFloat = 200

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myView)
        myView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        myView.center = view.center
    }

    @IBAction func didPinch(_ sender: UIPinchGestureRecognizer) {
        if(sender.state == .changed){
            let scale = sender.scale
            myView.frame = CGRect(x: 0, y: 0, width: size*scale, height: size*scale)
            myView.center = view.center
        }
    }
}
