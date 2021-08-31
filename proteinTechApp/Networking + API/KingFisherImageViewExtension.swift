//
//  KingFisherImageViewExtension.swift
//  proteinTechApp
//
//  Created by Furkan Yıldız on 27.08.2021.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(imageUrl: String){
        self.kf.setImage(with: URL(string: imageUrl))
    }
}
