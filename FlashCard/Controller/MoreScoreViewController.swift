//
//  MoreScoreViewController.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/15.
//

import UIKit

class MoreScoreViewController: UIViewController {
    // MARK: - @IBOutlet
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var areaNameLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!

    // MARK: - Instance
    var rankingData = Ranking(chiho: "", percent: 0.0, postDate: 0.0, documentId: "")

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = dateToString(date: rankingData.postDate)
        areaNameLabel.text = rankingData.chiho
        percentLabel.text = String(rankingData.percent)+"%"
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - @IBAction
    @IBAction func deleteButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "確認", message: "データを削除しますか？", preferredStyle: UIAlertController.Style.alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { [self](action: UIAlertAction!) -> Void in
            FirebaseManager.shared.deleteData(docId: rankingData.documentId, completion: { result in
                if result == false {
                    return
                } else {
                    self.navigationController?.popViewController(animated: true)
                }
            })
        })
        alert.addAction(alertAction)
        alert.addAction(UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - Method
    func dateToString(date: Double) -> String {
        let dateUnix: TimeInterval = date
        let newdate = NSDate(timeIntervalSince1970: dateUnix)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        let dateStr: String = formatter.string(from: newdate as Date)
        return dateStr
    }

}
