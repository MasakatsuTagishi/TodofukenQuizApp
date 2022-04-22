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
    static var rankingData: [Ranking] = []

    func registerId(completion: @escaping(Bool) -> Void){
        Auth.auth().signInAnonymously { [self] authResult, error in
            guard let user = authResult?.user
            else {
                return
            }
            let uid = user.uid
            try? keyChain.set(uid, key: "uid")
            completion(true)
        }
    }

    func sendData(chiho: String, percent: Double, postDate: Double, documentId: String) {
        let userId = try! keyChain.get("uid")!
        let rankingData = [
            "chiho": chiho,
            "percent": percent,
            "postDate": postDate,
            "documentId": documentId
        ] as [String : Any]
        db.collection(userId).document(documentId).setData(rankingData)
    }
    
    func fetchData(completion: @escaping (Result<[Ranking], Error>) -> Void) {
        let userId = try! keyChain.get("uid")!
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
                       let postDate = data["postDate"] as? Double {
                        let newRanking = Ranking(chiho: chiho, percent: percent, postDate: postDate, documentId: document.documentID)
                        FirebaseManager.rankingData.append(newRanking)
                        completion(.success(FirebaseManager.rankingData))
                    }
                }
            }
        }
    }
    
    func deleteData(docId: String, completion: @escaping (Bool) -> Void) {
        let userId = try! keyChain.get("uid")!
        db.collection(userId).document(docId).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
                completion(true)
            }
        }
    }
    
}
