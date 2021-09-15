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
    var questionCount = 0
    var wrongCount = 0
    var correctCount = 0
    var visible:Bool = false
    var listNumber = Int()
    
    let imagesFile = ImagesFile()
    let soundFile = SoundFile()
    let areaFile = AreaFile()
    
    let db = Firestore.firestore().collection("score")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let area = Area()
        //let todohuken = area.hokkaidoTohoku.randomElement()
        //answerLabel.text = todohuken?.name
        //imageView.image = todohuken?.image
        
        
        let random = imagesFile.areaArray[listNumber].randomElement()
        countLabel.text = "第\(questionNamber)問"
        changeVisible(visible: false)
        answerLabel.text = random?.areaText
        //print("tagi")
        //print(answerLabel.text as Any)
        imageView.image = UIImage(named: random!.areaAnswer)
        
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
        //×ボタンが押されたとき
        //不正解カウントを+1
        wrongCount = wrongCount + 1
//        print("不正解")
//        print(wrongCount)
        //不正解のときの音を鳴らす
        soundFile.playSound(fileName: "WrongSound", extentionName: "mp3")
        //imegeViewのimageをランダム表示（次の問題を表示）
        nextQuestions()
        //答えを非表示にする
        changeVisible(visible: false)
    }
    
    @IBAction func correctButton(_ sender: Any) {
        //○ボタンが押されたとき
        //正解カウントを+1
        correctCount = correctCount + 1
//        print("正解")
//        print(correctCount)
        //正解のときの音を鳴らす
        soundFile.playSound(fileName: "CorrectSound", extentionName: "mp3")
        //imegeViewのimageをランダム表示（次の問題を表示）
        nextQuestions()
        //答えを非表示にする
        changeVisible(visible: false)
    }
    
    @IBAction func sendButton(_ sender: Any) {
        //結果送信ボタン
        let chiho:String = areaFile.areaList[listNumber].areaImageNames
        let double1:Double = Double(correctCount)
        let double2:Double = Double(questionNamber-1)
        let percent:Double = round((double1/double2)*1000)/10
        let areaImage = areaFile.areaList[listNumber].areaImageTitles
        let postDate = Date().timeIntervalSince1970
        //Firestoreへscoreを送信
        db.document().setData(
            ["chiho":chiho,
             "percent":percent,
             "areaImage":areaImage,
             "postDate":postDate
            ]
        )
        //遷移先指定
        let vc = storyboard?.instantiateViewController(withIdentifier: "ScoreVC") as! ScoreViewController
        //ViewControllerの変数listNumberに数値を渡す
        //vc.listNumber = listNumber as Int
        //ScoreViewControllerへ遷移
        navigationController?.pushViewController(vc, animated: true)
        
        
//        DatabaseManager.shared.sendRecord(chiho: chiho, percent: percent, areaImage: areaImage, completion: { [weak self] result in
//            if result {
//                let tabVC = self?.storyboard?.instantiateViewController(identifier: "tabVC") as! TabBarViewController
//            } else {
//                tabVC.modalPresentationStyle = .fullScreen
//                self?.present(tabVC, animated: true, completion: nil)
//                let alert = UIAlertController(title: "エラー", message: "登録できなかったよ", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                self?.present(alert, animated: true, completion: nil)
//            }
//        })
    }
    
    func nextQuestions() {
        let random = imagesFile.areaArray[listNumber].randomElement()
        if questionNamber < 50 {
            questionNamber = questionNamber + 1
            questionCount = questionCount + 1
//            print("問題数")
//            print(questionCount)
            countLabel.text = "第\(questionNamber)問"
            imageView.image = UIImage(named: random!.areaText)
            answerLabel.text = random?.areaText
            //            print(answerLabel.text!)
            visible = false
        } else {
            print("問題が終了しました")
            //ランキング画面に遷移をさせる
            
        }
    }
    
    func changeVisible(visible: Bool) {
        if visible {
            answerLabel.isHidden = false
        } else {
            answerLabel.isHidden = true
        }
    }
    
}

