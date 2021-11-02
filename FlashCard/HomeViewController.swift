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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AreaCell", bundle: nil), forCellReuseIdentifier: "areaCell")
        tableView.rowHeight = 80
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let areacount = areaFile.chihoList
        return areacount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "areaCell", for: indexPath) as! AreaCell
        cell.areaImageView.image = UIImage(named:areaFile.chihoList[indexPath.row].areaImageTitles)
        cell.areaTextLabel.text = areaFile.chihoList[indexPath.row].areaImageNames
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewVC") as! ViewController
        vc.listNumber = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
