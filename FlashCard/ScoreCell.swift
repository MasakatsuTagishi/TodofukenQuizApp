//
//  ScoreCell.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/12.
//

import UIKit

class ScoreCell: UITableViewCell {
    
    @IBOutlet weak var scoreImageView: UIImageView!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
