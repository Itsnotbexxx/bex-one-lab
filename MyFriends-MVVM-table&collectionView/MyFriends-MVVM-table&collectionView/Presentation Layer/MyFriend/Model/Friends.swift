//
//  Friends.swift
//  MyFriends-MVVM-table&collectionView
//
//  Created by Бексултан Нурпейс on 20.04.2022.
//

import Foundation
import UIKit

struct Friends: Hashable{
    let avatarImage: UIImage?
    let nameLabel: String
    let jobLabel: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(avatarImage)
        hasher.combine(nameLabel)
        hasher.combine(jobLabel)
    }
}
