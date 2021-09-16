//
//  LoginViewController.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/11.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var titleText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationBarを非表示にする
        navigationController?.setNavigationBarHidden(true,animated:true)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        //ログインidを保存
        Auth.auth().signInAnonymously { authResult, error in
            guard let user = authResult?.user else { return }
            let uid = user.uid
            UserDefaults.standard.set(uid, forKey: "uid")
            //ホーム画面へ遷移
            let tabVC = self.storyboard?.instantiateViewController(identifier: "tabVC") as! TabBarViewController
            self.navigationController?.pushViewController(tabVC, animated: true)
        }
    }
    
    

}
