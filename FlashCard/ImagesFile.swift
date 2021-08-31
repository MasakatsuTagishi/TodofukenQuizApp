//
//  ImagesFile.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/08/29.
//

import Foundation

class ImagesFile{
    
    var kinkiList = [ImagesList]()
    
    init(){
        
        kinkiList.append(ImagesList(ImageName: "大阪府", Answer: "大阪府"))
        kinkiList.append(ImagesList(ImageName: "京都府", Answer: "京都府"))
        kinkiList.append(ImagesList(ImageName: "兵庫県", Answer: "兵庫県"))
        kinkiList.append(ImagesList(ImageName: "滋賀県", Answer: "滋賀県"))
        kinkiList.append(ImagesList(ImageName: "奈良県", Answer: "奈良県"))
        kinkiList.append(ImagesList(ImageName: "和歌山県", Answer: "和歌山県"))
        kinkiList.append(ImagesList(ImageName: "三重県", Answer: "三重県"))
        
    }
    
}
