//
//  ViewController.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/08/24.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var questionNamber = 1
    var correctCount = 0
    var visible:Bool = false
    var listNumber:Int = 0
    
    let soundFile = SoundFile()
    let keyChain = Keychain()
    
    let db = Firestore.firestore()

    let chihoList = [
        ChihoModel(name: "北海道・東北地方", image: UIImage(named: "北海道・東北地方")!),
        ChihoModel(name: "関東地方", image: UIImage(named: "関東地方")!),
        ChihoModel(name: "中部地方", image: UIImage(named: "中部地方")!),
        ChihoModel(name: "近畿地方", image: UIImage(named: "近畿地方")!),
        ChihoModel(name: "中国・四国地方", image: UIImage(named: "中国・四国地方")!),
        ChihoModel(name: "九州地方", image: UIImage(named: "九州地方")!),
        ChihoModel(name: "47都道府県", image: UIImage(named: "47都道府県")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let random = TodofukenList().allList[listNumber].randomElement()
        countLabel.text = "第\(questionNamber)問"
        changeVisible(visible: false)
        answerLabel.text = random?.name
        imageView.image = random?.image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func answerSwitching(_ sender: Any) {
        if visible {
            visible = false
            changeVisible(visible: visible)
        }else{
            visible = true
            changeVisible(visible: visible)
        }
    }
    
    @IBAction func wrongButton(_ sender: Any) {
        soundFile.playSound(fileName: "WrongSound", extentionName: "mp3")
        nextQuestions()
        changeVisible(visible: false)
    }
    
    @IBAction func correctButton(_ sender: Any) {
        if correctCount <= 49 {
            correctCountUp()
            soundFile.playSound(fileName: "CorrectSound", extentionName: "mp3")
            nextQuestions()
            changeVisible(visible: false)
        } else {
            return
        }
    }
    
    @IBAction func sendButton(_ sender: Any) {
        dataSend()
    }
    
    func nextQuestions() {
        let random = TodofukenList().allList[listNumber].randomElement()
        if questionNamber < 50 {
            questionNumberUp()
            countLabel.text = "第\(questionNamber)問"
            imageView.image = random?.image
            answerLabel.text = random?.name
            visible = false
        } else {
            questionNumberUp()
            //アラートを出す
            let alert = UIAlertController(title: "終了", message: "問題は50問までです。", preferredStyle: UIAlertController.Style.alert)
            let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) -> Void in
                print("問題が終了しました")
                self.dataSend()
            })
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func changeVisible(visible: Bool) {
        if visible {
            answerLabel.isHidden = false
        } else {
            answerLabel.isHidden = true
        }
    }
    
    func dataSend() {
        
        if questionNamber >= 2 {
            
            let chiho: String = chihoList[listNumber].name
            let double1: Double = Double(correctCount)
            let double2: Double = Double(questionNamber-1)
            let percent: Double = Calculator.caluculatePercent(correctCount: double1, questionNumber: double2)
            let postDate: Double = Date().timeIntervalSince1970
            let userId: String = try! keyChain.get("uid")!
            let documentId = db.collection(userId).document().documentID
            
            FirebaseManager.shared.sendData(chiho: chiho, percent: percent, postDate: postDate, documentId: documentId)
            
        } else {
            let alert = UIAlertController(title: "エラー", message: "問題を解いてください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func correctCountUp() {
        correctCount = Calculator.countUp(count: correctCount, addCount: 1)
    }
    
    func questionNumberUp() {
        questionNamber = Calculator.countUp(count: questionNamber, addCount: 1)
    }
    
}

