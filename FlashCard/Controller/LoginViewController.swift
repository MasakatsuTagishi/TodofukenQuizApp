//
//  LoginViewController.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/11.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - @IBAction
    @IBAction func loginButton(_ sender: UIButton) {
        sender.isEnabled = false
        registerId()
    }

    // MARK: - Method
    func registerId() {
        FirebaseManager.shared.registerId { result in
            if result {
                let tabVC = self.storyboard?.instantiateViewController(identifier: "tabVC") as! TabBarViewController
                    self.navigationController?.pushViewController(tabVC, animated: true)
            } else {
                return
            }
        }
    }

}


