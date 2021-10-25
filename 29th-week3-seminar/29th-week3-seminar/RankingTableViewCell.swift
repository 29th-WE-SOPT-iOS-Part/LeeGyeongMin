//
//  RankingTableViewCell.swift
//  29th-week3-seminar
//
//  Created by 이경민 on 2021/10/25.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    static let identifier = "RankingTableViewCell"
    
    // MARK: - Image View
    @IBOutlet weak var appIconImageView: UIImageView!
    // MARK: - Label
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    // MARK: - Button
    @IBOutlet weak var openButton: UIButton!
    
    override func awakeFromNib() {        // Initialization code
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(rank: Int, appData: AppContentData) {
        rankLabel.text = "\(rank)"
        appIconImageView.image = appData.makeImage()
        titleLabel.text = appData.appName
        subTitleLabel.text = appData.description
    }
    
}
