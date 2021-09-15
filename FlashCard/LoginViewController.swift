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
    
    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signInAnonymously { authResult, error in
            guard let user = authResult?.user else { return }
            let isAnonymous = user.isAnonymous  // true
            let uid = user.uid
            
            UserDefaults.standard.set(uid, forKey: "uid")
            
            let homeVC = self.storyboard?.instantiateViewController(identifier: "homeVC") as! HomeViewController
            self.navigationController?.pushViewController(homeVC, animated: true)
            
        }
        
        
    }
    
    

}
