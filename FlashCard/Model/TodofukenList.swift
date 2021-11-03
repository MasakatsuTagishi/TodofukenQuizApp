//
//  TodofukenList.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/11/03.
//

import UIKit

struct Todofuken {
    
    let name: String
    let chiho: chiho
    let image: UIImage
    
    enum chiho {
        case hokkaidoTohoku
        case kanto
        case chubu
        case kinki
        case chugokushikoku
        case kyusyu
        case all
    }
    
}

class AreaList {
    
    let hokkaidoTohoku = [
        Todofuken(name: "北海道", chiho: .hokkaidoTohoku, image: UIImage(named: "北海道")!),
        Todofuken(name: "青森県", chiho: .hokkaidoTohoku, image: UIImage(named: "青森県")!),
        Todofuken(name: "秋田県", chiho: .hokkaidoTohoku, image: UIImage(named: "秋田県")!),
        Todofuken(name: "岩手県", chiho: .hokkaidoTohoku, image: UIImage(named: "岩手県")!),
        Todofuken(name: "山形県", chiho: .hokkaidoTohoku, image: UIImage(named: "山形県")!),
        Todofuken(name: "宮城県", chiho: .hokkaidoTohoku, image: UIImage(named: "宮城県")!),
        Todofuken(name: "福島県", chiho: .hokkaidoTohoku, image: UIImage(named: "福島県")!)
    ]
    
    let kanto = [
        Todofuken(name: "茨城県", chiho: .kanto, image: UIImage(named: "茨城県")!),
        Todofuken(name: "栃木県", chiho: .kanto, image: UIImage(named: "栃木県")!),
        Todofuken(name: "群馬県", chiho: .kanto, image: UIImage(named: "群馬県")!),
        Todofuken(name: "埼玉県", chiho: .kanto, image: UIImage(named: "埼玉県")!),
        Todofuken(name: "千葉県", chiho: .kanto, image: UIImage(named: "千葉県")!),
        Todofuken(name: "東京都", chiho: .kanto, image: UIImage(named: "東京都")!),
        Todofuken(name: "神奈川県", chiho: .kanto, image: UIImage(named: "神奈川県")!)
    ]
    
    let chubu = [
        Todofuken(name: "新潟県", chiho: .chubu, image: UIImage(named: "新潟県")!),
        Todofuken(name: "富山県", chiho: .chubu, image: UIImage(named: "富山県")!),
        Todofuken(name: "石川県", chiho: .chubu, image: UIImage(named: "石川県")!),
        Todofuken(name: "福井県", chiho: .chubu, image: UIImage(named: "福井県")!),
        Todofuken(name: "山梨県", chiho: .chubu, image: UIImage(named: "山梨県")!),
        Todofuken(name: "長野県", chiho: .chubu, image: UIImage(named: "長野県")!),
        Todofuken(name: "岐阜県", chiho: .chubu, image: UIImage(named: "岐阜県")!),
        Todofuken(name: "静岡県", chiho: .chubu, image: UIImage(named: "静岡県")!),
        Todofuken(name: "愛知県", chiho: .chubu, image: UIImage(named: "愛知県")!)
    ]
    
    let kinki = [
        Todofuken(name: "大阪府", chiho: .kinki, image: UIImage(named: "大阪府")!),
        Todofuken(name: "京都府", chiho: .kinki, image: UIImage(named: "京都府")!),
        Todofuken(name: "兵庫県", chiho: .kinki, image: UIImage(named: "兵庫県")!),
        Todofuken(name: "滋賀県", chiho: .kinki, image: UIImage(named: "滋賀県")!),
        Todofuken(name: "奈良県", chiho: .kinki, image: UIImage(named: "奈良県")!),
        Todofuken(name: "和歌山県", chiho: .kinki, image: UIImage(named: "和歌山県")!),
        Todofuken(name: "三重県", chiho: .kinki, image: UIImage(named: "三重県")!)
    ]
    
    let chugokushikoku = [
        Todofuken(name: "広島県", chiho: .chugokushikoku, image: UIImage(named: "広島県")!),
        Todofuken(name: "岡山県", chiho: .chugokushikoku, image: UIImage(named: "岡山県")!),
        Todofuken(name: "鳥取県", chiho: .chugokushikoku, image: UIImage(named: "鳥取県")!),
        Todofuken(name: "島根県", chiho: .chugokushikoku, image: UIImage(named: "島根県")!),
        Todofuken(name: "山口県", chiho: .chugokushikoku, image: UIImage(named: "山口県")!),
        Todofuken(name: "徳島県", chiho: .chugokushikoku, image: UIImage(named: "徳島県")!),
        Todofuken(name: "香川県", chiho: .chugokushikoku, image: UIImage(named: "香川県")!),
        Todofuken(name: "高知県", chiho: .chugokushikoku, image: UIImage(named: "高知県")!),
        Todofuken(name: "愛媛県", chiho: .chugokushikoku, image: UIImage(named: "愛媛県")!)
    ]
    
    let kyushu = [
        Todofuken(name: "福岡県", chiho: .kyusyu, image: UIImage(named: "福岡県")!),
        Todofuken(name: "大分県", chiho: .kyusyu, image: UIImage(named: "大分県")!),
        Todofuken(name: "熊本県", chiho: .kyusyu, image: UIImage(named: "熊本県")!),
        Todofuken(name: "長崎県", chiho: .kyusyu, image: UIImage(named: "長崎県")!),
        Todofuken(name: "宮崎県", chiho: .kyusyu, image: UIImage(named: "宮崎県")!),
        Todofuken(name: "佐賀県", chiho: .kyusyu, image: UIImage(named: "佐賀県")!),
        Todofuken(name: "鹿児島県", chiho: .kyusyu, image: UIImage(named: "鹿児島県")!),
        Todofuken(name: "沖縄県", chiho: .kyusyu, image: UIImage(named: "沖縄県")!)
    ]
    
    let all = [
        Todofuken(name: "北海道", chiho: .all, image: UIImage(named: "北海道")!),
        Todofuken(name: "青森県", chiho: .all, image: UIImage(named: "青森県")!),
        Todofuken(name: "秋田県", chiho: .all, image: UIImage(named: "秋田県")!),
        Todofuken(name: "岩手県", chiho: .all, image: UIImage(named: "岩手県")!),
        Todofuken(name: "山形県", chiho: .all, image: UIImage(named: "山形県")!),
        Todofuken(name: "宮城県", chiho: .all, image: UIImage(named: "宮城県")!),
        Todofuken(name: "福島県", chiho: .all, image: UIImage(named: "福島県")!),
        Todofuken(name: "茨城県", chiho: .all, image: UIImage(named: "茨城県")!),
        Todofuken(name: "栃木県", chiho: .all, image: UIImage(named: "栃木県")!),
        Todofuken(name: "群馬県", chiho: .all, image: UIImage(named: "群馬県")!),
        Todofuken(name: "埼玉県", chiho: .all, image: UIImage(named: "埼玉県")!),
        Todofuken(name: "千葉県", chiho: .all, image: UIImage(named: "千葉県")!),
        Todofuken(name: "東京都", chiho: .all, image: UIImage(named: "東京都")!),
        Todofuken(name: "神奈川県", chiho: .all, image: UIImage(named: "神奈川県")!),
        Todofuken(name: "新潟県", chiho: .all, image: UIImage(named: "新潟県")!),
        Todofuken(name: "富山県", chiho: .all, image: UIImage(named: "富山県")!),
        Todofuken(name: "石川県", chiho: .all, image: UIImage(named: "石川県")!),
        Todofuken(name: "福井県", chiho: .all, image: UIImage(named: "福井県")!),
        Todofuken(name: "山梨県", chiho: .all, image: UIImage(named: "山梨県")!),
        Todofuken(name: "長野県", chiho: .all, image: UIImage(named: "長野県")!),
        Todofuken(name: "岐阜県", chiho: .all, image: UIImage(named: "岐阜県")!),
        Todofuken(name: "静岡県", chiho: .all, image: UIImage(named: "静岡県")!),
        Todofuken(name: "愛知県", chiho: .all, image: UIImage(named: "愛知県")!),
        Todofuken(name: "大阪府", chiho: .all, image: UIImage(named: "大阪府")!),
        Todofuken(name: "京都府", chiho: .all, image: UIImage(named: "京都府")!),
        Todofuken(name: "兵庫県", chiho: .all, image: UIImage(named: "兵庫県")!),
        Todofuken(name: "滋賀県", chiho: .all, image: UIImage(named: "滋賀県")!),
        Todofuken(name: "奈良県", chiho: .all, image: UIImage(named: "奈良県")!),
        Todofuken(name: "和歌山県", chiho: .all, image: UIImage(named: "和歌山県")!),
        Todofuken(name: "三重県", chiho: .all, image: UIImage(named: "三重県")!),
        Todofuken(name: "広島県", chiho: .all, image: UIImage(named: "広島県")!),
        Todofuken(name: "岡山県", chiho: .all, image: UIImage(named: "岡山県")!),
        Todofuken(name: "鳥取県", chiho: .all, image: UIImage(named: "鳥取県")!),
        Todofuken(name: "島根県", chiho: .all, image: UIImage(named: "島根県")!),
        Todofuken(name: "山口県", chiho: .all, image: UIImage(named: "山口県")!),
        Todofuken(name: "徳島県", chiho: .all, image: UIImage(named: "徳島県")!),
        Todofuken(name: "香川県", chiho: .all, image: UIImage(named: "香川県")!),
        Todofuken(name: "高知県", chiho: .all, image: UIImage(named: "高知県")!),
        Todofuken(name: "愛媛県", chiho: .all, image: UIImage(named: "愛媛県")!),
        Todofuken(name: "福岡県", chiho: .all, image: UIImage(named: "福岡県")!),
        Todofuken(name: "大分県", chiho: .all, image: UIImage(named: "大分県")!),
        Todofuken(name: "熊本県", chiho: .all, image: UIImage(named: "熊本県")!),
        Todofuken(name: "長崎県", chiho: .all, image: UIImage(named: "長崎県")!),
        Todofuken(name: "宮崎県", chiho: .all, image: UIImage(named: "宮崎県")!),
        Todofuken(name: "佐賀県", chiho: .all, image: UIImage(named: "佐賀県")!),
        Todofuken(name: "鹿児島県", chiho: .all, image: UIImage(named: "鹿児島県")!),
        Todofuken(name: "沖縄県", chiho: .all, image: UIImage(named: "沖縄県")!)
    ]
    
    var allList = [[Todofuken]]()
    
    init() {
        allList.append(hokkaidoTohoku)
        allList.append(kanto)
        allList.append(chubu)
        allList.append(kinki)
        allList.append(chugokushikoku)
        allList.append(kyushu)
        allList.append(all)
    }
    
}
