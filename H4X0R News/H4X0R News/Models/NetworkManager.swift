//
//  NetworkManager.swift
//  H4X0R News
//  Created by Nareshri Babu on 2020-04-26.
//  Copyright © 2020 Nareshri Babu. All rights reserved.
//  This app was created for learning purposes.
//  All images were only used for learning purposes and do not belong to me.
//  All sounds were only used for learning purposes and do not belong to me.
//



import Foundation

class NetworkManager: ObservableObject { //start to broadcast one or many of its properties to interested parties
    
    @Published var posts = [Post]()
    
    func fetchData() {
        
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                   let decoder = JSONDecoder()
                    
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            self.posts = results.hits
                        }
                        catch {
                            print(error)
                        }
                    }
                    
                }
            }
            
            task.resume() //starts networking task
        }
    }
}
