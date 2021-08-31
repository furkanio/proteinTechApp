//
//  Model.swift
//  proteinTechApp
//
//  Created by Furkan Yıldız on 24.08.2021.
//

import Foundation

struct Model : Decodable {
    let results: [User]
   /*
    enum CodingKeys: String, CodingKey {
        
        case results = "results"
        
    }*/
}

struct User : Decodable {
    var name: Name
    var login: Login
    var email: String?
    var phone: String?
    var picture: Picture
    var location: Location
    var nat: String
    
   /* enum CodingKeys: String, CodingKey{
        
        case name = "Name"
        case email = "email"
        case phone = "phone"
        case picture = "Picture"
        case location = "Location"
       
    } */
}

struct Login : Decodable {
    var username: String?
}

struct Name : Decodable {
    var first: String!
    var last: String!
    
  /*  enum CodingKeys: String, CodingKey{
        
        case first = "first"
        case last = "last"
       
    }*/
}

struct Location : Decodable {
    var city: String!
    var state: String!
    var country: String!
    var coordinates : Cordinates
    
   /* enum CodingKeys: String, CodingKey{
        
        case city = "city"
        case state = "state"
        case country = "country"
        case coordinates = "Cordinates"
    
       
    }*/
    
}
    struct Cordinates : Decodable {
        var latitude : String?
        var longitude : String?
        
      /*  enum CodingKeys: String, CodingKey{
            
            case latitude = "latitude"
            case longitude = "longitude"
            
        
           
        } */
    }
    
    


struct Picture: Decodable {
    var thumbnail: String
    var medium: String
    var large: String
    
  /*  enum CodingKeys: String, CodingKey{
        
        case thumbnail = "thumbnail"
        case large = "large"
        
    
       
    } */
    
}
