//
//  FriendViewModel.swift
//  proteinTechApp
//
//  Created by Furkan Yıldız on 26.08.2021.
//

import Foundation
import UIKit

class FriendViewModel {
    
    private var service = Service()
    private var friends = [User]()
    
    func fetchAllFriendData(completion: @escaping () -> ()) {
        
        service.getFriendData { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.friends = listOf.results
                completion()
            case .failure(let error):
                // Something is wrong with the JSON file or the model
                print("Error processing json data: \(error)")
            }
        }

    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if friends.count != 0 {
            return friends.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> User {
        
        return friends[indexPath.row]
    }
    
    func didSelectRowAt (indexPath: IndexPath) -> User {
        return friends[indexPath.row]
        
    }
    
    }
