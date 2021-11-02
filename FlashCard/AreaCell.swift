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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
