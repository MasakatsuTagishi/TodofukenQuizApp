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
    
    let keyChain = Keychain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ScoreCell", bundle: nil), forCellReuseIdentifier: "scoreCell")
        tableView.rowHeight = 80
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        FirebaseManager.shared.getData { [weak self] result in
            switch result {
            case .success(let ranking):
                FirebaseManager.rankingData = ranking
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        navigationItem.hidesBackButton = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FirebaseManager.rankingData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as! ScoreCell
        let scoreImageView = cell.contentView.viewWithTag(1) as! UIImageView
        scoreImageView.image = UIImage(named:FirebaseManager.rankingData[indexPath.row].chiho)
        let areaLabel = cell.contentView.viewWithTag(2) as! UILabel
        areaLabel.text = FirebaseManager.rankingData[indexPath.row].chiho
        let scoreLabel = cell.contentView.viewWithTag(3) as! UILabel
        scoreLabel.text = String(FirebaseManager.rankingData[indexPath.row].percent)+"%"
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
        
        let areaLabel:String = FirebaseManager.rankingData[indexPath.row].chiho
        let scoreLabel:Double = FirebaseManager.rankingData[indexPath.row].percent
        let date:Double = FirebaseManager.rankingData[indexPath.row].postDate
        let docId:String = FirebaseManager.rankingData[indexPath.row].documentId
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "MoreScoreVC") as! MoreScoreViewController
        vc.areaLabel = areaLabel
        vc.scoreLabel = scoreLabel
        vc.date = date
        vc.docId = docId

        navigationController?.pushViewController(vc, animated: true)
    }
    
}

