import UIKit

class videoTableViewCell: UITableViewCell {

    static let identifier = "videoTableViewCell"
    
    // MARK: - ImageView
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var creatorImageVIew: UIImageView!
    
    // MARK: - Label
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoInfoLabel: UILabel!
    
    // MARK: - Button
    @IBOutlet weak var moreMenuButton: UIButton!
    
    var delegate: myTableViewDelegate?
    var presentingVideo: VideoContentData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setGesture()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setGesture(){
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(videoTableViewCell.imageViewTapped))
        videoImageView.addGestureRecognizer(tapRecognizer)
        videoImageView.isUserInteractionEnabled = true
    }
    
    @objc func imageViewTapped(){
        delegate?.myTableViewDelegate(videoToPresent: presentingVideo!)
    }
    
    func setData(videoData: VideoContentData) {
        presentingVideo = videoData
        videoTitleLabel.text = videoData.videoTitle
        videoInfoLabel.text = videoData.videoInfo
        videoImageView.image = videoData.makeImageForVideo()
        creatorImageVIew.image = videoData.makeImageForCreator()
        videoImageView.contentMode = .scaleAspectFill
    }
    
}

protocol myTableViewDelegate {
    func myTableViewDelegate(videoToPresent: VideoContentData)
}
