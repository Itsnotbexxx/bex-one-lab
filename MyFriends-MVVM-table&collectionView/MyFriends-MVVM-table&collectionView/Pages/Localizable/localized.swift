//
//  localized.swift
//  MyFriends-MVVM-table&collectionView
//
//  Created by Бексултан Нурпейс on 22.04.2022.
//

import Foundation

extension String{
    func localized() -> String{
        return NSLocalizedString(
            self,
            comment: self
        )
    }
}
