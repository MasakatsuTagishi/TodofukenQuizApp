//
//  TabBarViewController.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/15.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true,animated:true)
    }

}
