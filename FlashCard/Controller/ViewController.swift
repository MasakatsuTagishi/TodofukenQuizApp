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
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    // MARK: - Properties
    var indexNum: Int = 0
    var correctCount: Double = 0
    var questionNumber: Int = 1
    let alert = Alert()
    let keyChain = Keychain()

    let chihoList = [
        ChihoModel(name: "北海道・東北地方", image: UIImage(named: "北海道・東北地方")!),
        ChihoModel(name: "関東地方", image: UIImage(named: "関東地方")!),
        ChihoModel(name: "中部地方", image: UIImage(named: "中部地方")!),
        ChihoModel(name: "近畿地方", image: UIImage(named: "近畿地方")!),
        ChihoModel(name: "中国・四国地方", image: UIImage(named: "中国・四国地方")!),
        ChihoModel(name: "九州地方", image: UIImage(named: "九州地方")!),
        ChihoModel(name: "47都道府県", image: UIImage(named: "47都道府県")!)
    ]

    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        upDateUI()
        alert.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func imageViewTaped(_ sender: UITapGestureRecognizer) {
        answerLabel.isHidden.toggle()
    }
    
    @IBAction func wrongButtonPressed(_ sender: UIButton) {
        roundCrossSound(fileName: "WrongSound", extentionName: "mp3")
        nextQuestion()
    }
    
    @IBAction func correctButtonPressed(_ sender: UIButton) {
        let maxCount: Double = 50
        if correctCount <= maxCount - 1 {
            correctCount = countUp(count: Int(correctCount), addCount: 1)
            roundCrossSound(fileName: "CorrectSound", extentionName: "mp3")
            nextQuestion()
        } else {
            sender.isEnabled = false
            return
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        sendRankingData()
    }
    
    // MARK: - Methods
    private func upDateUI() {
        let todofukenList = TodofukenList()
        let random = todofukenList.allList[indexNum].randomElement()
        DispatchQueue.main.async {
            self.questionNumberLabel.text = "第\(self.questionNumber)問"
            self.answerLabel.text = random?.name
            self.answerLabel.isHidden = true
            self.imageView.image = random?.image
        }
    }

    private func nextQuestion() {
        let maxCount: Int = 50
        questionNumber = Int(countUp(count: questionNumber, addCount: 1))
        if questionNumber < maxCount {
            upDateUI()
        } else {
            endAlert()
        }
    }

    private func countUp(count: Int, addCount: Double) -> Double {
        return Double(count) + addCount
    }

    private func caluculatePercent(_ correctCount: Double, _ questionNumber: Double) -> Double {
        return round((correctCount/questionNumber)*1000)/10
    }

    private func endAlert() {
        alert.endAlert(title: "終了", message: "問題は50問までです。") { [weak self] _ in
            self?.sendRankingData()
        }
    }

    private func errorAlert() {
        alert.errorAlert(title: "エラー", message: "問題を解いてください")
    }

    private func roundCrossSound(fileName: String, extentionName: String) {
        let soundFile = SoundFile()
        soundFile.playSound(fileName: fileName, extentionName: extentionName)
    }

    private func sendRankingData() {
        let minCount: Int = 2
        if questionNumber >= minCount {
            setRankingDataToFirestore()
        } else {
            errorAlert()
            return
        }
        backViewContller()
    }

    private func setRankingDataToFirestore() {
        let db = Firestore.firestore()
        let chiho: String = chihoList[indexNum].name
        let percent: Double = caluculatePercent(correctCount, Double(questionNumber - 1))
        let postDate: Double = Date().timeIntervalSince1970
        let userId: String = try! keyChain.get("uid")!
        let documentId = db.collection(userId).document().documentID
        FirebaseManager.shared.sendData(chiho: chiho, percent: percent, postDate: postDate, documentId: documentId)
    }

    private func backViewContller() {
        navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - AlertDelegate
extension ViewController: AlertDelegate {
    func present(alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
}
