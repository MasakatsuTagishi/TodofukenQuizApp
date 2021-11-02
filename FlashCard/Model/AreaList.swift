//
//  AreaList.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/08.

class AreaList {
    
    let areaImageNames:String
    let areaImageTitles:String
    let areaImageText:String
    
    init(ImageName:String, ImageTitle:String, ImageText:String) {
        areaImageNames = ImageName
        areaImageTitles = ImageTitle
        areaImageText = ImageText
    }
    
}

//struct Todofuken {
//    let name: String
//    let chiho: chiho
//    let image: UIImage
//    
//    enum chiho {
//        case hokkaidoTohoku
//        case kanto
//        case chubu
//        case kyusyu
//    }
//}
//
//class Area {
//    let hokkaidoTohoku = [
//        Todofuken(name: "北海道", chiho: .hokkaidoTohoku, image: UIImage(named: "hokkaido")!),
//        Todofuken(name: "青森", chiho: .hokkaidoTohoku, image: UIImage(named: "aomori")!),
//    ]
//}
