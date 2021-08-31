//
//  friendsDetail.swift
//  proteinTechApp
//
//  Created by Furkan Yıldız on 23.08.2021.
//

import Foundation
import UIKit
import Kingfisher
import MapKit
import CoreLocation

class friendsDetail: UIViewController,CLLocationManagerDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var detailImagee: UIImageView!
    
    @IBOutlet weak var detailNat: UILabel!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailUserName: UILabel!
    @IBOutlet weak var detailCity: UILabel!
    @IBOutlet weak var detailState: UILabel!
    @IBOutlet weak var detailCountry: UILabel!
    @IBOutlet weak var detailEmail: UILabel!
    
    var value = "Detailed information about this launch could not be found."
    
    var friend : User!
    
    let manager = CLLocationManager()
   
    
    
    func setCellWithValuesOfDetail (_ friend:User) {
        updateUI(detailName: friend.name.first + " " + friend.name.last, detailUserName:"@" + friend.login.username!, detailCity: friend.location.city  ,detailNat:friend.nat, detailState:friend.location.state,detailCountry:friend.location.country , detailImagee:friend.picture.medium
        )
    }
    private func updateUI(detailName: String?,detailUserName:String?, detailCity: String?,detailNat:String?,detailState:String?,detailCountry:String?,detailImagee:String? ){
        
        self.detailName.text = detailName
        self.detailUserName.text = detailUserName
        self.detailCity.text = detailCity
        self.detailState.text = detailState
        self.detailCountry.text = detailCountry
        self.detailNat.text = detailNat?.uppercased()
        
        self.detailImagee.setImage(imageUrl: detailImagee!)
        
        
    }
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        self.detailName.text = self.friend.name.first +  " " + self.friend.name.last
        self.detailEmail.text = "E-mail: " + self.friend.email!
        self.detailUserName.text = "@" + self.friend.login.username!
        self.detailCity.text = self.friend.location.city
        self.detailState.text = self.friend.location.state
        self.detailCountry.text = self.friend.location.country
        self.detailNat.text = self.friend.nat.uppercased()
        self.detailImagee.setImage(imageUrl: self.friend.picture.large)
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        manager.desiredAccuracy = kCLLocationAccuracyBest // battery
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            
            render(location: location)
        }
    }
    
    func render ( location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: Double(friend.location.coordinates.latitude!)! , longitude: Double(friend.location.coordinates.longitude!)!)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        
        let region = MKCoordinateRegion(center: coordinate , span: span)
        mapView.setRegion(region,
                          animated: true)
        
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = friend.name.first + " is here"
        pin.subtitle = "As you can see"
        
        mapView.addAnnotation(pin)
        
    }
    
}

