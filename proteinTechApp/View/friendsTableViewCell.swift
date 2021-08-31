//
//  friendsTableViewCell.swift
//  proteinTechApp
//
//  Created by Furkan Yıldız on 26.08.2021.
//

import UIKit
import Kingfisher

final class friendsTableViewCell: UITableViewCell {

   
   
    @IBOutlet weak var friendsImageView: UIImageView!
    
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendLocationLabel: UILabel!
    @IBOutlet weak var friendNatLabel: UILabel!
    
    private var urlString: String = ""
    
    func setCellWithValuesOf (_ friend:User) {
        updateUI(friendNameLabel: friend.name.first + " " + friend.name.last, friendLocationLabel: friend.location.city + " , " + friend.location.country , friendNatLabel:friend.nat , friendsImageView:friend.picture.medium
        )
    }
    
    private func updateUI(friendNameLabel: String?, friendLocationLabel: String?,friendNatLabel:String?,friendsImageView:String? ){
        
        self.friendNameLabel.text = friendNameLabel
        self.friendLocationLabel.text = friendLocationLabel
        self.friendNatLabel.text = friendNatLabel?.uppercased()
        self.friendsImageView.setImage(imageUrl: friendsImageView!)
        
        
    }
}
