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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(videoData: VideoContentData) {
        videoTitleLabel.text = videoData.videoTitle
        videoInfoLabel.text = videoData.videoInfo
        videoImageView.image = videoData.makeImageForVideo()
        creatorImageVIew.image = videoData.makeImageForCreator()
        videoImageView.contentMode = .scaleAspectFill
    }
    
}
