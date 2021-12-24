import UIKit

class PassVC: UIViewController {

    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoInfoLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var passedVideo: VideoContentData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    func setData(){
        guard let video = passedVideo else { return }
        videoImageView.image = UIImage(named: video.videoImageIconName)
        videoTitleLabel.text = video.videoTitle
        videoInfoLabel.text = video.videoInfo
    }
    
    @IBAction func touchUpToGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
