//
//  Repository.swift
//  Giftatte22
//
//  Created by duck on 2023/12/07.
//

import Foundation
import Firebase

class Repository{
    func fetchGiftData(collection1: String, document1:String, collection2: String, document2: String, onCompleted: @escaping ([MainResultModel])-> Void){
        let db = Firestore.firestore()
        
        var model = [MainResultModel]()
        
        
        let onboardingRef = db.collection(collection1).document(document1).collection(collection2).document(document2).collection("appInfo")
        onboardingRef.getDocuments(){(querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    do{
                        let data = document.data()
                        let jsonData = try JSONSerialization.data(withJSONObject: data)
                        let giftData = try JSONDecoder().decode(Gift.self, from: jsonData)
                        
                        
                        model.append(MainResultModel(imageUrl: giftData.imageUrl, keyword: giftData.keyword, lowPrice: giftData.lowPrice))
                        
                    }catch let err{
                        print("err: \(err)")
                    }
                }
            }
            onCompleted(model)
        }
        
    }
}
