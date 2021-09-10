//
//  ImagesFile.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/08/29.
//

import Foundation

//class ImagesFile{



class ImagesFile{
    
    var HokkaidoTohokuList = [ImagesList]()
    var kantoList = [ImagesList]()
    var chubuList = [ImagesList]()
    var kinkiList = [ImagesList]()
    var chugokuShikokuList = [ImagesList]()
    var kyushuList = [ImagesList]()
    var allList = [ImagesList]()
    var areaArray = [[ImagesList]]()
    
    let hogeList = [
        ImagesList(ImageName: "北海道", Answer: "北海道"),
        ImagesList(ImageName: "青森県", Answer: "青森県"),
        ImagesList(ImageName: "青森県", Answer: "青森県")
    ]
    
    init(){
        HokkaidoTohokuList.append(ImagesList(ImageName: "北海道", Answer: "北海道"))
        HokkaidoTohokuList.append(ImagesList(ImageName: "青森県", Answer: "青森県"))
        HokkaidoTohokuList.append(ImagesList(ImageName: "秋田県", Answer: "秋田県"))
        HokkaidoTohokuList.append(ImagesList(ImageName: "岩手県", Answer: "岩手県"))
        HokkaidoTohokuList.append(ImagesList(ImageName: "山形県", Answer: "山形県"))
        HokkaidoTohokuList.append(ImagesList(ImageName: "宮城県", Answer: "宮城県"))
        HokkaidoTohokuList.append(ImagesList(ImageName: "福島県", Answer: "福島県"))
        kantoList.append(ImagesList(ImageName: "茨城県", Answer: "茨城県"))
        kantoList.append(ImagesList(ImageName: "栃木県", Answer: "栃木県"))
        kantoList.append(ImagesList(ImageName: "群馬県", Answer: "群馬県"))
        kantoList.append(ImagesList(ImageName: "埼玉県", Answer: "埼玉県"))
        kantoList.append(ImagesList(ImageName: "千葉県", Answer: "千葉県"))
        kantoList.append(ImagesList(ImageName: "東京都", Answer: "東京都"))
        kantoList.append(ImagesList(ImageName: "神奈川県", Answer: "神奈川県"))
        chubuList.append(ImagesList(ImageName: "新潟県", Answer: "新潟県"))
        chubuList.append(ImagesList(ImageName: "富山県", Answer: "富山県"))
        chubuList.append(ImagesList(ImageName: "石川県", Answer: "石川県"))
        chubuList.append(ImagesList(ImageName: "福井県", Answer: "福井県"))
        chubuList.append(ImagesList(ImageName: "山梨県", Answer: "山梨県"))
        chubuList.append(ImagesList(ImageName: "長野県", Answer: "長野県"))
        chubuList.append(ImagesList(ImageName: "岐阜県", Answer: "岐阜県"))
        chubuList.append(ImagesList(ImageName: "静岡県", Answer: "静岡県"))
        chubuList.append(ImagesList(ImageName: "愛知県", Answer: "愛知県"))
        kinkiList.append(ImagesList(ImageName: "大阪府", Answer: "大阪府"))
        kinkiList.append(ImagesList(ImageName: "京都府", Answer: "京都府"))
        kinkiList.append(ImagesList(ImageName: "兵庫県", Answer: "兵庫県"))
        kinkiList.append(ImagesList(ImageName: "滋賀県", Answer: "滋賀県"))
        kinkiList.append(ImagesList(ImageName: "奈良県", Answer: "奈良県"))
        kinkiList.append(ImagesList(ImageName: "和歌山県", Answer: "和歌山県"))
        kinkiList.append(ImagesList(ImageName: "三重県", Answer: "三重県"))
        chugokuShikokuList.append(ImagesList(ImageName: "広島県", Answer: "広島県"))
        chugokuShikokuList.append(ImagesList(ImageName: "岡山県", Answer: "岡山県"))
        chugokuShikokuList.append(ImagesList(ImageName: "鳥取県", Answer: "鳥取県"))
        chugokuShikokuList.append(ImagesList(ImageName: "島根県", Answer: "島根県"))
        chugokuShikokuList.append(ImagesList(ImageName: "山口県", Answer: "山口県"))
        chugokuShikokuList.append(ImagesList(ImageName: "徳島県", Answer: "徳島県"))
        chugokuShikokuList.append(ImagesList(ImageName: "香川県", Answer: "香川県"))
        chugokuShikokuList.append(ImagesList(ImageName: "高知県", Answer: "高知県"))
        chugokuShikokuList.append(ImagesList(ImageName: "愛媛県", Answer: "愛媛県"))
        kyushuList.append(ImagesList(ImageName: "福岡県", Answer: "福岡県"))
        kyushuList.append(ImagesList(ImageName: "大分県", Answer: "大分県"))
        kyushuList.append(ImagesList(ImageName: "熊本県", Answer: "熊本県"))
        kyushuList.append(ImagesList(ImageName: "長崎県", Answer: "長崎県"))
        kyushuList.append(ImagesList(ImageName: "宮崎県", Answer: "宮崎県"))
        kyushuList.append(ImagesList(ImageName: "佐賀県", Answer: "佐賀県"))
        kyushuList.append(ImagesList(ImageName: "鹿児島県", Answer: "鹿児島県"))
        kyushuList.append(ImagesList(ImageName: "沖縄県", Answer: "沖縄県"))
        allList.append(ImagesList(ImageName: "北海道", Answer: "北海道"))
        allList.append(ImagesList(ImageName: "青森県", Answer: "青森県"))
        allList.append(ImagesList(ImageName: "秋田県", Answer: "秋田県"))
        allList.append(ImagesList(ImageName: "岩手県", Answer: "岩手県"))
        allList.append(ImagesList(ImageName: "山形県", Answer: "山形県"))
        allList.append(ImagesList(ImageName: "宮城県", Answer: "宮城県"))
        allList.append(ImagesList(ImageName: "福島県", Answer: "福島県"))
        allList.append(ImagesList(ImageName: "茨城県", Answer: "茨城県"))
        allList.append(ImagesList(ImageName: "栃木県", Answer: "栃木県"))
        allList.append(ImagesList(ImageName: "群馬県", Answer: "群馬県"))
        allList.append(ImagesList(ImageName: "埼玉県", Answer: "埼玉県"))
        allList.append(ImagesList(ImageName: "千葉県", Answer: "千葉県"))
        allList.append(ImagesList(ImageName: "東京都", Answer: "東京都"))
        allList.append(ImagesList(ImageName: "神奈川県", Answer: "神奈川県"))
        allList.append(ImagesList(ImageName: "新潟県", Answer: "新潟県"))
        allList.append(ImagesList(ImageName: "富山県", Answer: "富山県"))
        allList.append(ImagesList(ImageName: "石川県", Answer: "石川県"))
        allList.append(ImagesList(ImageName: "福井県", Answer: "福井県"))
        allList.append(ImagesList(ImageName: "山梨県", Answer: "山梨県"))
        allList.append(ImagesList(ImageName: "長野県", Answer: "長野県"))
        allList.append(ImagesList(ImageName: "岐阜県", Answer: "岐阜県"))
        allList.append(ImagesList(ImageName: "静岡県", Answer: "静岡県"))
        allList.append(ImagesList(ImageName: "愛知県", Answer: "愛知県"))
        allList.append(ImagesList(ImageName: "大阪府", Answer: "大阪府"))
        allList.append(ImagesList(ImageName: "京都府", Answer: "京都府"))
        allList.append(ImagesList(ImageName: "兵庫県", Answer: "兵庫県"))
        allList.append(ImagesList(ImageName: "滋賀県", Answer: "滋賀県"))
        allList.append(ImagesList(ImageName: "奈良県", Answer: "奈良県"))
        allList.append(ImagesList(ImageName: "和歌山県", Answer: "和歌山県"))
        allList.append(ImagesList(ImageName: "三重県", Answer: "三重県"))
        allList.append(ImagesList(ImageName: "広島県", Answer: "広島県"))
        allList.append(ImagesList(ImageName: "岡山県", Answer: "岡山県"))
        allList.append(ImagesList(ImageName: "鳥取県", Answer: "鳥取県"))
        allList.append(ImagesList(ImageName: "島根県", Answer: "島根県"))
        allList.append(ImagesList(ImageName: "山口県", Answer: "山口県"))
        allList.append(ImagesList(ImageName: "徳島県", Answer: "徳島県"))
        allList.append(ImagesList(ImageName: "香川県", Answer: "香川県"))
        allList.append(ImagesList(ImageName: "高知県", Answer: "高知県"))
        allList.append(ImagesList(ImageName: "愛媛県", Answer: "愛媛県"))
        allList.append(ImagesList(ImageName: "福岡県", Answer: "福岡県"))
        allList.append(ImagesList(ImageName: "大分県", Answer: "大分県"))
        allList.append(ImagesList(ImageName: "熊本県", Answer: "熊本県"))
        allList.append(ImagesList(ImageName: "長崎県", Answer: "長崎県"))
        allList.append(ImagesList(ImageName: "宮崎県", Answer: "宮崎県"))
        allList.append(ImagesList(ImageName: "佐賀県", Answer: "佐賀県"))
        allList.append(ImagesList(ImageName: "鹿児島県", Answer: "鹿児島県"))
        allList.append(ImagesList(ImageName: "沖縄県", Answer: "沖縄県"))
        areaArray.append(HokkaidoTohokuList)
        areaArray.append(kantoList)
        areaArray.append(chubuList)
        areaArray.append(kinkiList)
        areaArray.append(chugokuShikokuList)
        areaArray.append(kyushuList)
        areaArray.append(allList)
    }
    
    
    
}

