//
//  ViewController.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import UIKit

enum TabBar : Int{
    case homePage
    case profile
    
    var icon: UIImage? {
        switch self {
        case .homePage:
            return UIImage(systemName: "house.fill")
        case .profile:
            return UIImage(systemName: "person.crop.circle.fill")
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .homePage:
            return UIImage(systemName: "house.fill")
        case .profile:
            let image = UIImage(systemName: "person.crop.circle.fill")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            imageView.tintColor = UIColor.blue
            return imageView.image
        }
    }
    var navigationController: UINavigationController {
        let navigation = UINavigationController()
        navigation.tabBarItem.image = self.icon
        navigation.tabBarItem.selectedImage = self.selectedImage
        return navigation
    }
}

