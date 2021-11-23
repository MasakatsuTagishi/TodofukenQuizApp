//
//  DatabaseManager.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/17.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class FirebaseManager {
    
    static let shared = FirebaseManager()
    private init() {}
    
    let db = Firestore.firestore()
    let keyChain = Keychain()
    static var rankingData:[Ranking] = []
    
    func sendData(chiho: String, percent: Double, postDate: Double, documentId: String) {
        let userId = try! keyChain.get("uid")!
        let rankingData = [
            "chiho":chiho,
            "percent":percent,
            "postDate":postDate,
            "documentId":documentId
        ] as [String : Any]
        db.collection(userId).document(documentId).setData(rankingData)
    }
    
    func getData(completion: @escaping (Result<[Ranking], Error>) -> Void) {
        let userId = try! keyChain.get("uid")!
//        var rankingData:[Ranking] = []
        db.collection(userId).order(by: "percent", descending: true).addSnapshotListener { querySnapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let snapshotDoc = querySnapshot?.documents {
                FirebaseManager.rankingData = []
                for document in snapshotDoc {
                    let data = document.data()
                    if let chiho = data["chiho"] as? String,
                       let percent = data["percent"] as? Double,
                       let postDate = data["postDate"] as? Double{
                        let newRanking = Ranking(chiho: chiho, percent: percent, postDate: postDate, documentId: document.documentID)
                        FirebaseManager.rankingData.append(newRanking)
                        completion(.success(FirebaseManager.rankingData))
                        print(FirebaseManager.rankingData)
                    }
                }
            }
        }
    }
}
            
           
//            guard let documents = querySnapshot?.documents else {
//                        print("Error fetching documents: \(error!)")
//                        return
//                    }
//
//
//
//            if error != nil {return}
//            if let snapshotDoc = snapshot?.documents {
//                for document in snapshotDoc {
//                    let data = document.data()
//                    if let chiho = data["chiho"] as? String,
//                       let percent = data["percent"] as? Double,
//                       let postDate = data["postDate"] as? Double{
//                        let newRankingData = Ranking(chiho: chiho, percent: percent, postDate: postDate, documentId: document.documentID)
//                        rankingData.append(newRankingData)
//                    }
//                }
//            }
//        }
//    }
//}
        
//        let userId = try! keyChain.get("uid")!
//        var dataSets = ScoreViewController().dataSets
//        db.collection(userId).order(by: "percent", descending: true).addSnapshotListener { (snapshot, error) in
//            if error != nil {return}
//            dataSets = []
//            if let snapshotDoc = snapshot?.documents {
//                for document in snapshotDoc {
//                    let data = document.data()
//                    if let chiho = data["chiho"] as? String,
//                       let percent = data["percent"] as? Double,
//                       let postDate = data["postDate"] as? Double{
//                        let newDataSet = DataSet(chiho: chiho, percent: percent, postDate: postDate, documentId: document.documentID)
//                        dataSets.append(newDataSet)
//                    }
//                }
//            }
//        }
//        return dataSets
//    }
//
//
//}

