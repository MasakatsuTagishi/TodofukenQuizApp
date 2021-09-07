//
//  AreaCell.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/07.
//

import UIKit

class AreaCell: UITableViewCell {

    @IBOutlet weak var areaImageView: UIImageView!
    @IBOutlet weak var areaTextLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
//        self.layer.shadowOffset = CGSize(width: 2, height: 4)
////        self.layer.shadowRadius = 10.0
//        self.layer.shadowOpacity = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
