import UIKit

class SecondVC: UIViewController {
    static let identifier = "SecondVC"
    
    @IBOutlet weak var textField: UITextField!
    
    var receivedText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = receivedText
    }
    
    @IBAction func touchUpToSend(_ sender: Any) {
        
        NotificationCenter.default.post(name: NSNotification.Name("iOS-Sample"), object: textField.text ?? "")
        let presentingVC = presentingViewController as? FirstVC
        presentingVC?.textField.text = textField.text
        dismiss(animated: true, completion: nil)
    }

    func setDataInTextField(data: String){
//        textField.text = data
        print("넘겨받은 data = \(data)")
    }
}
