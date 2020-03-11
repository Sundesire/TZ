//
//  Networking.swift
//  TZ
//
//  Created by Иван Бабушкин on 10.03.2020.
//  Copyright © 2020 Ivan Babushkin. All rights reserved.
//

import Foundation

class Networking {
    
    let helper: Helper!
    
    init?(helper: Helper) {
        self.helper = helper
    }
    
    func loginUser(userName: String, uid: String, completionHandler: @escaping(_ token: String?) -> ()) {
        
        let url = "https://handlingso.club/api/1.0/user"
        var urlRequest = URLRequest(url: URL(string: url)!)
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpMethod = "POST"
        
        let dictionary = ["name": userName, "uid": uid]
        urlRequest.httpBody = try! JSONEncoder().encode(dictionary)
        
        let session = URLSession.shared
        session.dataTask(with: urlRequest) {(data, response, error) in
            
            guard error == nil else {
                completionHandler(nil)
                print(error ?? "Unknown Error")
                return
            }
            
            guard let data = data else {
                    return
            }

            do {
                let responseObject = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJSON = responseObject as? [String: Any] {
                    let token = responseJSON["token"] as? String
                    completionHandler(token)
                }
            } catch {
                print(error)
            }

        }.resume()
    }
    
    func getRating(completionHandler: @escaping (_ rating: [Users]?)->() ) {
        let token = helper.getToken()
        let url = "https://handlingso.club/api/1.0/rating"
        var urlRequest = URLRequest(url: URL(string: url)!)
        
        guard token != nil else { return }
        
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
        
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            
            guard error == nil else {
                completionHandler(nil)
                return
            }
            
            guard let data = data else { return }
            
            let json = self.decodeJSON(type: Rating.self, from: data)
            completionHandler(json!.rows)
            
        }.resume()
    }
    
    private func decodeJSON<T: Decodable> (type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = data, let response = try? decoder.decode(type.self, from: data) else { return nil}
        return response
    }
}
