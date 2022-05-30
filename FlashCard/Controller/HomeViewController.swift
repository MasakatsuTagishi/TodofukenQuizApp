//
//  HomeViewController.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/07.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Property
    let chihoList = [
        ChihoModel(name: "北海道・東北地方", image: UIImage(named: "北海道・東北地方")!),
        ChihoModel(name: "関東地方", image: UIImage(named: "関東地方")!),
        ChihoModel(name: "中部地方", image: UIImage(named: "中部地方")!),
        ChihoModel(name: "近畿地方", image: UIImage(named: "近畿地方")!),
        ChihoModel(name: "中国・四国地方", image: UIImage(named: "中国・四国地方")!),
        ChihoModel(name: "九州地方", image: UIImage(named: "九州地方")!),
        ChihoModel(name: "47都道府県", image: UIImage(named: "47都道府県")!)
    ]

    // MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!

    // MARK: - LifeCycle
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

}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewVC") as! ViewController
        vc.indexNum = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chihoList.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "areaCell", for: indexPath) as! AreaCell
        cell.areaTextLabel.text = chihoList[indexPath.row].name
        cell.areaImageView.image = chihoList[indexPath.row].image
        return cell
    }

}
