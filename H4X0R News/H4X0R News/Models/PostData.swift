//
//  PostData.swift
//  H4X0R News
//  Created by Nareshri Babu on 2020-04-26.
//  Copyright © 2020 Nareshri Babu. All rights reserved.
//  This app was created for learning purposes.
//  All images were only used for learning purposes and do not belong to me.
//  All sounds were only used for learning purposes and do not belong to me.
//


import Foundation


struct Results: Decodable {
    
    let hits: [Post]
}


struct Post: Decodable, Identifiable {
    
    var id: String {
        return objectID
    }
    
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
    
}
