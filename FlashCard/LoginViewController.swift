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
    
    let keyChain = Keychain()
    private var isPlaying = false
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true,animated:true)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if isPlaying { return }
        isPlaying = true
        registerId()
    }
    
    func registerId() {
        DispatchQueue.global().async {
            Auth.auth().signInAnonymously { [self] authResult, error in
                guard let user = authResult?.user
                else {
                    return
                }
                let uid = user.uid
                try? keyChain.set(uid, key: "uid")
                let tabVC = self.storyboard?.instantiateViewController(identifier: "tabVC") as! TabBarViewController
                self.navigationController?.pushViewController(tabVC, animated: true)
            }
            self.isPlaying = false
        }
    }
}


