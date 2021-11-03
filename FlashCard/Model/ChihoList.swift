//
//  AreaList.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/08.

import UIKit

struct Chiho {
    
    let chihoNames:String
    
    init(chihoName:String) {
        chihoNames = chihoName
    }
    
}

class ChihoList {
    
    var chiho = [Chiho]()
    
    let chihoList = [
        Chiho(chihoName: "北海道・東北地方"),
        Chiho(chihoName: "関東地方"),
        Chiho(chihoName: "中部地方"),
        Chiho(chihoName: "近畿地方"),
        Chiho(chihoName: "中国・四国地方"),
        Chiho(chihoName: "九州地方"),
        Chiho(chihoName: "47都道府県")
    ]
    
}
