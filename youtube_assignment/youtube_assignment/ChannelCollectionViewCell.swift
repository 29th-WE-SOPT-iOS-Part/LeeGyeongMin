import UIKit

class ChannelCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ChannelCollectionViewCell"
    
    // MARK: - Button
    @IBOutlet weak var creatorProfileButton: UIButton!
    
    // MARK: - Label
    @IBOutlet weak var creatorNameLabel: UILabel!
    
    func setData(creatorName : String, creatorProfile: UIImage?){
        creatorNameLabel.text = creatorName
        creatorProfileButton.setImage(creatorProfile, for: .normal)
    }
}
