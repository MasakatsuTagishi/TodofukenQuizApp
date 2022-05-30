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
        ChihoModel(name: "北海道・東北", image: UIImage(named: "北海道・東北地方")!),
        ChihoModel(name: "関東", image: UIImage(named: "関東地方")!),
        ChihoModel(name: "中部", image: UIImage(named: "中部地方")!),
        ChihoModel(name: "近畿", image: UIImage(named: "近畿地方")!),
        ChihoModel(name: "中国・四国", image: UIImage(named: "中国・四国地方")!),
        ChihoModel(name: "九州", image: UIImage(named: "九州地方")!),
        ChihoModel(name: "47都道府県", image: UIImage(named: "47都道府県")!)
    ]

    let margin: CGFloat = 10.0

    // MARK: - @IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

}

// MARK: - UITableViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewVC") as! ViewController
        vc.indexNum = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)
        if let cell = cell as? CustomCell {
            cell.image.image = chihoList[indexPath.row].image
            cell.label.text = chihoList[indexPath.row].name
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chihoList.count
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return margin
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return margin
    }
}
