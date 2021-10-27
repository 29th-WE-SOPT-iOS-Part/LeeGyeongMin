import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    // MARK: - ImageView
    @IBOutlet weak var logoImageVIew: UIImageView!
    
    // MARK: - Label
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    
    // MARK: - TextField
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Button
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @objc func textFieldDidChange(_ textField : UITextField) {
        if(nameTextField.hasText && contactTextField.hasText && passwordTextField.hasText){
            nextButton.isEnabled = true
        }
        else {
            nextButton.isEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.text?.removeAll()
        contactTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
    
    func initialization(){
        nextButton.isEnabled = false
        nameTextField.delegate = self
        contactTextField.delegate = self
        passwordTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        contactTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @IBAction func touchUpToCreateAccount(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinVC") as? JoinVC else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

    @IBAction func touchUpToGoNext(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC")
                as? ResultVC else {return}
        
        
        nextVC.name = nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
}
