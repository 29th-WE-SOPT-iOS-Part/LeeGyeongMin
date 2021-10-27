import UIKit

class ChannelCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ChannelCollectionViewCell"
    
    // MARK: - ImageView
    @IBOutlet weak var creatorProfileImageView: UIImageView!
    
    // MARK: - Label
    @IBOutlet weak var creatorNameLabel: UILabel!
    
    func setData(creatorName : String, creatorProfile: UIImage?){
        creatorNameLabel.text = creatorName
        creatorProfileImageView.image = creatorProfile
    }
}
