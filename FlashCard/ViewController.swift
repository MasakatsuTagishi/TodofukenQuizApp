//
//  ViewController.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var questionNamber = 1
    var questionCount = 0
    var wrongCount = 0
    var correctCount = 0
    var tapCount = 2
    
    let imagesFile = ImagesFile()
    let soundFile = SoundFile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let random = imagesFile.kinkiList.randomElement()!
        countLabel.text = "第\(questionNamber)問"
        changeVisible(visible: false)
        answerLabel.text = random.kinkiText
        imageView.image = UIImage(named: random.kinkiText)
    }
    
    
    @IBAction func answerSwitching(_ sender: Any) {
        tapCount = tapCount + 1
        if tapCount % 2 != 0{
            changeVisible(visible: true)
        }else{
            changeVisible(visible: false)
        }
    }
    
    @IBAction func wrongButton(_ sender: Any) {
        //×ボタンが押されたとき
        //不正解カウントを+1
        wrongCount = wrongCount + 1
//        print(wrongCount)
        //不正解のときの音を鳴らす
        soundFile.playSound(fileName: "WrongSound", extentionName: "mp3")
        //imegeViewのimageをランダム表示
        nextQuestions()
        changeVisible(visible: false)
    }
    
    @IBAction func correctButton(_ sender: Any) {
        //○ボタンが押されたとき
        //正解カウントを+1
        correctCount = correctCount + 1
//        print(correctCount)
        //正解のときの音を鳴らす
        soundFile.playSound(fileName: "CorrectSound", extentionName: "mp3")
        //imegeViewのimageをランダム表示
        nextQuestions()
        changeVisible(visible: false)
    }
    
    @IBAction func sendButton(_ sender: Any) {
        
        
        
    }
    
    func nextQuestions() {
        let random = imagesFile.kinkiList.randomElement()!
        if questionNamber < 50 {
            questionNamber = questionNamber + 1
            questionCount = questionCount + 1
            countLabel.text = "第\(questionNamber)問"
            imageView.image = UIImage(named: random.kinkiText)
            answerLabel.text = random.kinkiAnswer
            print(answerLabel.text!)
            tapCount = 2
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

