import UIKit

class FunctionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FunctionCollectionViewCell"
    
    // MARK: - Button
    @IBOutlet weak var functionNameButton: UIButton!
    
    func setData(functionIcon : UIImage?){
        functionNameButton.setImage(functionIcon, for: .normal)
    }
}
