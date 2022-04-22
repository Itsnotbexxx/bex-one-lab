//
//  addNewFriends.swift
//  MyFriends-MVVM-table&collectionView
//
//  Created by Бексултан Нурпейс on 20.04.2022.
//

import Foundation
import UIKit

struct NewContacts: Hashable{
    let imageName: String
    let name: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(imageName)
        hasher.combine(name)
    }
}
