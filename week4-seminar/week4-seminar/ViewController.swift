import UIKit

class ViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpToLogin(_ sender: Any) {
        requestLogin()
        getUserData()
    }
    
    func simpleAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert,animated: true)
    }
}

extension ViewController { //기능 단위로 나눠서 server 기능 밖으로 뺌
    func requestLogin(){
        UserSignService.shared.login(email: emailTextField.text ?? "" ,
                                     password: passwordTextField.text ?? ""){ responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                if let userData = response.data {
                    self.simpleAlert(title: response.message,
                                     message: "\(userData.name)님 환영합니다!")
                }
                
            case .requestErr(let msg):
                print("requestErr \(msg)")
                
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
                
            }
        }
    }
    
    func getUserData(){
        UserSignService.shared.readUserData(userId: 2){ responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }

                if let userData = response.data {
                    self.userTextLabel.text = userData.name
                }
                
            case .requestErr(let msg):
                print("requestErr \(msg)")
                
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
                
            }
        }
    }
}
