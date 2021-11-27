import UIKit

protocol KeywordCellDelegate {
    func keywordCellSelected(cell: KeyWordCVC)
    func keywordCellUnselected(cell: KeyWordCVC, unselectedName: String)
}

class KeyWordCVC: UICollectionViewCell {
static let identifier = "KeyWordCVC"
    @IBOutlet weak var keywordButton: UIButton!
    var keyword: String = ""
    var selectedKeyword: Bool = false
    var keywordDelegate: KeywordCellDelegate?
    var presentingClosure: (() -> ())? //void -> void, optional
    
    override func awakeFromNib() {
        super.awakeFromNib()
        keywordButton.tintColor = .black
    }

    @IBAction func touchUpToSelect(_ sender: Any) {
        if selectedKeyword {
            keywordDelegate?.keywordCellUnselected(cell: self,unselectedName: keyword)
            keywordButton.backgroundColor = .clear
        }
        else {
            keywordDelegate?.keywordCellSelected(cell: self)
            keywordButton.backgroundColor = .gray
            presentingClosure?()
        }
        selectedKeyword.toggle()
    }
    
    func setKeyword(text: String){
        keyword = text
        keywordButton.setTitle(keyword, for: .normal)
    }
}
