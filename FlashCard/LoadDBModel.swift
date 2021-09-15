//
//  DatabaseManager.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/09/11.
//

import Foundation
import FirebaseFirestore

class LoadDBModel {
    
    var dataSets = [DataSet]()
    let db = Firestore.firestore()
    
    func loadContents() {
        
        print("bbb")
        print(dataSets)
        //Documentの取得→percentの大きい順に取得する
        db.collection("score").order(by: "percent").addSnapshotListener { (snapshot, error) in
            
            self.dataSets = []
            
            if error != nil {return}
            
            if let snapshotDoc = snapshot?.documents {
                
                for document in snapshotDoc {
                    
                    let data = document.data()
                    
                    if let areaImage = data["areaImage"] as? String,
                       let chiho = data["chiho"] as? String,
                       let percent = data["percent"] as? Double,
                       let postDate = data["postDate"] as? Double {
                        
                        let newDataSet = DataSet(areaImage: areaImage, chiho: chiho, percent: percent, postDate: postDate)
                        self.dataSets.append(newDataSet)
                        self.dataSets.reverse()
                        
                    }
                }
            }
            print("aaa")
            print(self.dataSets)
        }
    }
    
}

