//
//  HomeViewController.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/07.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let areaFile = AreaFile()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //デリゲート記述
        tableView.delegate = self
        tableView.dataSource = self
        //カスタムセル記述
        tableView.register(UINib(nibName: "AreaCell", bundle: nil), forCellReuseIdentifier: "areaCell")
        tableView.rowHeight = 80
        //tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let areacount = areaFile.areaList
        return areacount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "areaCell", for: indexPath) as! AreaCell
        cell.areaImageView.image = UIImage(named:areaFile.areaList[indexPath.row].areaImageTitles)
        print(cell.areaImageView as Any)
        cell.areaTextLabel.text = areaFile.areaList[indexPath.row].areaImageNames
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //セルの高さ指定
        //        tableView.estimatedRowHeight = 100
        //        tableView.rowHeight = UITableViewAutomaticDimension
        //        return UITableView.automaticDimension
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //タップした行の数をlistNumberに入れる
        let listNumber:Int = indexPath.row
        print(type(of: listNumber))
        //遷移先指定
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewVC") as! ViewController
        //ViewControllerの変数listNumberに数値を渡す
        vc.listNumber = listNumber as Int
        //ViewControllerへ遷移
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
