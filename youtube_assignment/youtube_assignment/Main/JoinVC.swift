import UIKit

class JoinVC : UIViewController, UITextFieldDelegate {

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
    
    var requestStatus : Bool?
    
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
        
        initTextFieldOption(nameTextField)
        initTextFieldOption(contactTextField)
        initTextFieldOption(passwordTextField)
        
        if #available(iOS 12.0, *){
            passwordTextField.textContentType = .oneTimeCode
        }
    }
    
    func initTextFieldOption(_ textField : UITextField){
        textField.smartDashesType = .no
        textField.autocorrectionType = .no
        textField.smartDashesType = .no
        textField.smartInsertDeleteType = .no
        textField.smartQuotesType = .no
        textField.spellCheckingType = .no
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == passwordTextField && !showPasswordButton.isSelected){
            textField.isSecureTextEntry = true
        }
    }
    
    
    @IBAction func touchUpToShowPassword(_ sender: Any) {
        showPasswordButton.isSelected = !showPasswordButton.isSelected
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func touchUpToGoNext(_ sender: Any) {
        requestJoin()
    }
    
    func simpleAlert(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default){
            UIAlertAction in
                
                if (self.requestStatus == true){
                    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
                    
                    nextVC.name = self.nameTextField.text
                    nextVC.modalPresentationStyle = .fullScreen
                    self.present(nextVC, animated: true){
                        self.navigationController?.popViewController(animated: true)
                    }
                
                }
            
            
        }
        alert.addAction(okAction)
        present(alert, animated: true)

    }
    
}

extension JoinVC {
    func requestJoin(){
        UserJoinService.shared.join(name: nameTextField.text ?? "", email: contactTextField.text ?? "", password: passwordTextField.text ?? ""){ responseData in
            switch responseData {
            case .success(let joinResponse):
                guard let response = joinResponse as? JoinResponseData else {return}
                self.simpleAlert(title: "회원가입", message: response.message)
                self.requestStatus = response.success
            case .requestErr(let msg):
                print("requestERR \(msg)")
                self.requestStatus = false
            case .pathErr(let joinResponse):
                print("pathErr")
                guard let response = joinResponse as? JoinResponseData else {return}
                self.simpleAlert(title: "회원가입", message: response.message)
                self.requestStatus = response.success
            case .serverErr:
                print("serverErr")
                self.requestStatus = false
            case .networkFail:
                print("networkFail")
                self.requestStatus = false
            }
        }
    }
}
