//
//  DatabaseManager.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/17.
//

//import Foundation
//import Firebase
//import FirebaseFirestore
//
//class DataBase {
//    
//    let db = Firestore.firestore()
//    let userId = UserDefaults.standard.value(forKey: "uid") as! String
//
//    func loadContents() -> [DataSet] {
//        
//        var dataSets:[DataSet] = []
//
//        db.collection("score").whereField("userId", isEqualTo: userId).order(by: "percent", descending: true).addSnapshotListener { (snapshot, error) in
//            if error != nil {return}
//            if let snapshotDoc = snapshot?.documents {
//                for document in snapshotDoc {
//                    let data = document.data()
//                    if let areaImage = data["areaImage"] as? String,
//                       let chiho = data["chiho"] as? String,
//                       let percent = data["percent"] as? Double,
//                       let postDate = data["postDate"] as? Double
//                    {
//                        let newDataSet = DataSet(areaImage: areaImage, chiho: chiho, percent: percent, postDate: postDate, documentId: document.documentID)
//                        dataSets.append(newDataSet)
//                        print("hoge")
//                        print(dataSets)
//                    }
//                }
//            }
//        }
//        return dataSets
//    }
//}
