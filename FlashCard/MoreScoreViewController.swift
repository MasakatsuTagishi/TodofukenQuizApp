//
//  MoreScoreViewController.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/15.
//

import UIKit
import Firebase
import FirebaseFirestore

class MoreScoreViewController: UIViewController {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var registerTitle: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var areaTitle: UILabel!
    @IBOutlet weak var areaNameLabel: UILabel!
    @IBOutlet weak var scoreTitle: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    let db = Firestore.firestore()
    var dataSets = [DataSet]()
    var scoreImage = String()
    var areaLabel = String()
    var scoreLabel = Double()
    var date = Double()
    var docId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateUnix: TimeInterval = date
        let newdate = NSDate(timeIntervalSince1970: dateUnix)
        //NSDate型を日時文字列に変換するためのNSDateFormatterを生成
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        //NSDateFormatterを使ってNSDate型 "date" を日時文字列 "dateStr" に変換
        let dateStr: String = formatter.string(from: newdate as Date)
        
        dateLabel.text = dateStr
        areaNameLabel.text = areaLabel
        percentLabel.text = String(scoreLabel)+"%"
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        //FireStore内のデータを削除
        db.collection("score").document(docId).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
                //削除の確認アラートを出す
                
                //１つ前の画面（score画面）へ遷移
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        //1つ前の画面（score画面）へ遷移
        self.navigationController?.popViewController(animated: true)
    }
    
}
