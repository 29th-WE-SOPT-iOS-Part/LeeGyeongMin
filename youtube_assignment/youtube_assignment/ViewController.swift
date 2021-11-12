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

        initTextFieldOption(nameTextField)
        initTextFieldOption(contactTextField)
        initTextFieldOption(passwordTextField)
        
        passwordTextField.isSecureTextEntry = false
        
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
        if(textField == passwordTextField){
            textField.isSecureTextEntry = true
        }
    }
    
    @IBAction func touchUpToCreateAccount(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinVC") as? JoinVC else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

    @IBAction func touchUpToGoNext(_ sender: Any) {
        requestLogin()
    }
    
    func simpleAlert(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default){
            UIAlertAction in
                
                if (self.requestStatus == true){
                    
                    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC")
                            as? ResultVC else {return}
                    nextVC.name = self.nameTextField.text
                    nextVC.modalPresentationStyle = .fullScreen
                        self.present(nextVC, animated: false, completion: nil)
                }
            
            
        }
        alert.addAction(okAction)
        present(alert, animated: true)

    }
    
}

extension ViewController {
    func requestLogin(){
        UserSignService.shared.login(email: contactTextField.text ?? "", password: passwordTextField.text ?? "") { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else {return}
                self.simpleAlert(title: "로그인", message:response.message)
                self.requestStatus = response.success
                
            case .requestErr(let msg):
                print("requestERR \(msg)")
                self.requestStatus = false
                
            case .pathErr(let loginResponse):
                print("pathErr")
                guard let response = loginResponse as? LoginResponseData else {return}
                self.simpleAlert(title: "로그인", message:response.message)
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
