//
//  Service.swift
//  proteinTechApp
//
//  Created by Furkan Yıldız on 24.08.2021.
//

import Foundation
//import Alamofire

class Service {private var dataTask: URLSessionDataTask?
    
    func getFriendData(completion: @escaping (Result<Model, Error>) -> Void) {
        
        let popularMoviesURL = "https://randomuser.me/api/?results=20"
        //let endpoint = ""
        
        guard let url = URL(string: popularMoviesURL) else {return}
        
        
        // Create URL Session - work on the background
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Handle Error
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            do {
                // Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Model.self, from: data)
                
                // Back to the main thread
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
    }
}
