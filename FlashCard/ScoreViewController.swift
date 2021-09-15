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
    
    let db = Firestore.firestore()
    var dataSets = [DataSet]()
    
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
        print("ccc")
        print(dataSets.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //score用に書き直す
        let scorecount = dataSets
        return scorecount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //score用に書き直す
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as! ScoreCell
        let scoreImageView = cell.contentView.viewWithTag(1) as! UIImageView
        scoreImageView.image = UIImage(named:dataSets[indexPath.row].areaImage)
        let areaLabel = cell.contentView.viewWithTag(2) as! UILabel
        areaLabel.text = dataSets[indexPath.row].chiho
        let scoreLabel = cell.contentView.viewWithTag(3) as! UILabel
        scoreLabel.text = String(dataSets[indexPath.row].percent)
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
        //score用に書き直す
        //タップした行の数をlistNumberに入れる
        //let listNumber:Int = indexPath.row
        //print(type(of: listNumber))
        //遷移先指定
        //let vc = storyboard?.instantiateViewController(withIdentifier: "ViewVC") as! ViewController
        //ViewControllerの変数listNumberに数値を渡す
        //vc.listNumber = listNumber as Int
        //ViewControllerへ遷移
        //navigationController?.pushViewController(vc, animated: true)
    }
    
    func loadContents() {
        
        print("bbb")
        print(dataSets)
        //Documentの取得→percentの大きい順に取得する
        db.collection("score").order(by: "percent").addSnapshotListener { (snapshot, error) in
            
            self.dataSets = []
            
            if error != nil {return}
            
            if let snapshotDoc = snapshot?.documents {
                
                for document in snapshotDoc {
                    
                    let data = document.data()
                    
                    if let areaImage = data["areaImage"] as? String,
                       let chiho = data["chiho"] as? String,
                       let percent = data["percent"] as? Double,
                       let postDate = data["postDate"] as? Double {
                        
                        let newDataSet = DataSet(areaImage: areaImage, chiho: chiho, percent: percent, postDate: postDate)
                        self.dataSets.append(newDataSet)
                        self.dataSets.reverse()
                        self.tableView.reloadData()
                        
                    }
                }
            }
            print("aaa")
            print(self.dataSets)
        }
    }
    
}
