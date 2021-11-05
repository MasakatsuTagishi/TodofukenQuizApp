//
//  ScoreViewController.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/12.
//

import UIKit
import Firebase
import FirebaseFirestore

class ScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSets = [DataSet]()
    let keyChain = Keychain()
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //デリゲート記述
        tableView.delegate = self
        tableView.dataSource = self
        //カスタムセル記述
        tableView.register(UINib(nibName: "ScoreCell", bundle: nil), forCellReuseIdentifier: "scoreCell")
        tableView.rowHeight = 80
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadContents()
        tableView.reloadData()
        //backButtonを非表示
        navigationItem.hidesBackButton = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as! ScoreCell
        let scoreImageView = cell.contentView.viewWithTag(1) as! UIImageView
        scoreImageView.image = UIImage(named:dataSets[indexPath.row].chiho)
        let areaLabel = cell.contentView.viewWithTag(2) as! UILabel
        areaLabel.text = dataSets[indexPath.row].chiho
        let scoreLabel = cell.contentView.viewWithTag(3) as! UILabel
        scoreLabel.text = String(dataSets[indexPath.row].percent)+"%"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //変数に情報を格納する
        let areaLabel:String = dataSets[indexPath.row].chiho
        let scoreLabel:Double = dataSets[indexPath.row].percent
        let date:Double = dataSets[indexPath.row].postDate
        let docId:String = dataSets[indexPath.row].documentId
        //遷移先指定
        let vc = storyboard?.instantiateViewController(withIdentifier: "MoreScoreVC") as! MoreScoreViewController
        //MoreScoreViewControllerの変数を渡す
        vc.areaLabel = areaLabel
        vc.scoreLabel = scoreLabel
        vc.date = date
        vc.docId = docId
        //MoreScoreViewControllerへ遷移
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func loadContents() {
        let loginUserId = try! keyChain.get("uid")
        UserDefaults.standard.set(loginUserId, forKey: "uid")
        let userId:String = UserDefaults.standard.value(forKey: "uid") as! String
        //Documentの取得→percentの大きい順に取得する
        db.collection(userId).order(by: "percent", descending: true).addSnapshotListener { (snapshot, error) in
            if error != nil {return}
            if let snapshotDoc = snapshot?.documents {
                self.dataSets = []
                for document in snapshotDoc {
                    let data = document.data()
                    if let chiho = data["chiho"] as? String,
                       let percent = data["percent"] as? Double,
                       let postDate = data["postDate"] as? Double{
                        let newDataSet = DataSet(chiho: chiho, percent: percent, postDate: postDate, documentId: document.documentID)
                        self.dataSets.append(newDataSet)
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}



//class DataBase {
//    let db = Firestore.firestore()
//
//    func loadContents() -> [DataSet] {
//        var dataSets:[DataSet] = []
//
//        db.collection("score").order(by: "percent", descending: true).addSnapshotListener { (snapshot, error) in
//            if error != nil {return}
//            if let snapshotDoc = snapshot?.documents {
//                for document in snapshotDoc {
//                    let data = document.data()
//                    if let areaImage = data["areaImage"] as? String,
//                       let chiho = data["chiho"] as? String,
//                       let percent = data["percent"] as? Double,
//                       let postDate = data["postDate"] as? Double
//                    {
//                        let newDataSet = DataSet(areaImage: areaImage, chiho: chiho, percent: percent, postDate: postDate, documentId: document.documentID)
//                        dataSets.append(newDataSet)
//                    }
//                }
//            }
//        }
//
//        return dataSets
//    }
//}
