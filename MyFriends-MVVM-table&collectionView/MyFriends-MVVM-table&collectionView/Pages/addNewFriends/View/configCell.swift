//
//  configCell.swift
//  MyFriends-MVVM-table&collectionView
//
//  Created by Бексултан Нурпейс on 20.04.2022.
//

import Foundation

protocol configCell{
    associatedtype DataType
    static var reuseIdentifier: String { get }
    func configure(data: DataType)
}

extension configCell{
    static var reuseIdentifier: String { return String(describing: Self.self) }
}
