import UIKit

class GestureVC: UIViewController {

    @IBOutlet weak var testView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
        
        let tapRecognizer2 = UITapGestureRecognizer()
        tapRecognizer2.addTarget(self, action: #selector(tapView(gestureRecognizer:)))
        
        testView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tapView(gestureRecognizer: UIGestureRecognizer){
        print("뷰 안에서 tap")
    }
    
}
