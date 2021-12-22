import UIKit
import Lottie

class ViewController: UIViewController {

    var animator: UIViewPropertyAnimator?
    
    lazy var lottieView: AnimationView = {
        let animationView = AnimationView(name: "seminar8-sample")
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        animationView.center = self.view.center
        animationView.contentMode = .scaleToFill
        animationView.stop()
        animationView.isHidden = true
        
        return animationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lottieView)
    }
    
    @IBAction func touchUpToStartAnimation(_ sender: Any) {
        lottieView.isHidden = false
        lottieView.play()
    }
    
    @IBAction func touchUpToPauseAnimation(_ sender: Any) {
        lottieView.pause()
    }
    
    @IBAction func touchUpToStopAnimation(_ sender: Any) {
        lottieView.isHidden = true
        lottieView.stop()
    }
    
}

