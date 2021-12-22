import UIKit

class FunctionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FunctionCollectionViewCell"
    
    // MARK: - UIView
    @IBOutlet weak var functionBorderView: UIView!
    
    // MARK: - Label
    @IBOutlet weak var functionNameLabel: UILabel!
    
    func setData(functionName : String){
        functionNameLabel.text = functionName
        functionBorderView.layer.cornerRadius = 20
        functionBorderView.layer.borderWidth = 1
        functionBorderView.layer.borderColor = UIColor(red: 0.854, green: 0.854, blue: 0.854, alpha: 1).cgColor
        functionBorderView.layer.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        
    }
}
