import UIKit

class FirstVC: UIViewController {
    static let identifier = "FirstVC"
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpToSend(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else {return}

        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived), name: NSNotification.Name("iOS-Sample"), object: nil) //selector = 실행될거
        
        present(nextVC, animated: true, completion: nil)
        
//        performSegue(withIdentifier: "presentSecondVC", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentSecondVC" {
            let nextVC = segue.destination as? SecondVC
            nextVC?.receivedText = textField.text ?? ""
        }
    }
    
    @objc func dataReceived(notification: NSNotification){
        if let text = notification.object as? String {
            textField.text = text
        }
    }
}
