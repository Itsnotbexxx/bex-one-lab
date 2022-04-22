//
//  mightKnowContacts.swift
//  MyFriends-MVVM-table&collectionView
//
//  Created by Бексултан Нурпейс on 21.04.2022.
//

import Foundation
import UIKit

struct MightKonwContacts: Hashable{
    let imageName: String
    let nickName: String
    let numName: String
    let add: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(imageName)
        hasher.combine(nickName)
        hasher.combine(numName)
        hasher.combine(add)
    }
}
