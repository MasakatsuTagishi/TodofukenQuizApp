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
    let alert = Alert()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = dateToString(date: rankingData.postDate)
        areaNameLabel.text = rankingData.chiho
        percentLabel.text = String(rankingData.percent)+"%"
        self.tabBarController?.tabBar.isHidden = true
        alert.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - @IBAction
    @IBAction func deleteButton(_ sender: UIButton) {
        alert.deleteAlert(title: "確認", message: "データを削除しますか？") { [weak self] _ in
            self?.deleteData(docId: self?.rankingData.documentId ?? "")
        }
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

    func deleteData(docId: String) {
        FirebaseManager.shared.deleteData(docId: docId) { result in
            if result {
                self.navigationController?.popViewController(animated: true)
            } else {
                return
            }
        }
    }

}

//MARK: - AlertDelegate
extension MoreScoreViewController: AlertDelegate {
    func present(alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
}
