//
//  AreaFile.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/08.
//

import Foundation

class AreaFile {
    
    var areaList = [AreaList]()
    
    init() {
        areaList.append(AreaList(ImageName: "北海道・東北地方", ImageTitle: "北海道・東北地方", ImageText:"HokkaidoTohoku"))
        areaList.append(AreaList(ImageName: "関東地方", ImageTitle: "関東地方", ImageText:"Kanto"))
        areaList.append(AreaList(ImageName: "中部地方", ImageTitle: "中部地方", ImageText:"Chubu"))
        areaList.append(AreaList(ImageName: "近畿地方", ImageTitle: "近畿地方", ImageText:"Kinki"))
        areaList.append(AreaList(ImageName: "中国・四国地方", ImageTitle: "中国・四国地方", ImageText:"ChugokuShikoku"))
        areaList.append(AreaList(ImageName: "九州地方", ImageTitle: "九州地方", ImageText:"kyushuList"))
        areaList.append(AreaList(ImageName: "47都道府県", ImageTitle: "47都道府県", ImageText:"All"))
    }
    
}
