import UIKit

class ResultVC: UIViewController,UITabBarDelegate {

    // MARK: - ImageView
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Label
    @IBOutlet weak var showNameLabel: UILabel!
    
    // MARK: - Button
    @IBOutlet weak var endButton: UIButton!
    @IBOutlet weak var anotherAccountButton: UIButton!

    var name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setName()
    }
    
    func setName(){
        if let userName = name {
            if(userName.count>0){
                showNameLabel.text="\(userName)님\n환영합니다!"
            }
        }
    }
    
    @IBAction func touchUpToGoNext(_ sender: Any) {
        let tabbarSB = UIStoryboard.init(name: "Tabbar", bundle: nil)
        guard let nextVC = tabbarSB.instantiateViewController(withIdentifier: "TabbarController") as? UITabBarController
        else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    @IBAction func touchUpToGoLogin(_ sender: Any) {
        let presentingVC = self.presentingViewController
        
        self.dismiss(animated: true) {
            guard let mainVC = presentingVC as? UINavigationController else {return}
            mainVC.popToRootViewController(animated: true)
        }
    }
}
