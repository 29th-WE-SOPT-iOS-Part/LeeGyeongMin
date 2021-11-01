import UIKit

class JoinVC: UIViewController, UITextFieldDelegate {

    // MARK: - ImageView
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Label
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var showPasswordLabel: UILabel!
    
    // MARK: - TextField
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Button
    @IBOutlet weak var showPasswordButton: UIButton!
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

    func initialization(){
        nextButton.isEnabled = false
        showPasswordButton.isSelected = false
        nameTextField.delegate = self
        contactTextField.delegate = self
        passwordTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        contactTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @IBAction func touchUpToShowPassword(_ sender: Any) {
        showPasswordButton.isSelected = !showPasswordButton.isSelected
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func touchUpToGoNext(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
        
        nextVC.name = nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true){
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
