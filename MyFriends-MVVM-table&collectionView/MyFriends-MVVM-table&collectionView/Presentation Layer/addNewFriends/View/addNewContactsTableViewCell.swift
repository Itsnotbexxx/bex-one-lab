//
//  addNewFriendsTableViewCell.swift
//  MyFriends-MVVM-table&collectionView
//
//  Created by Бексултан Нурпейс on 20.04.2022.
//

import UIKit

typealias NewContacsCellConfigurator = TableCellConfigurator<addNewContactsTableViewCell, NewContacts>

class addNewContactsTableViewCell: UITableViewCell, configCell {
    
    private let avatarImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [avatarImage, nameLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setup()
     }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
    override func layoutSubviews() {
         super.layoutSubviews()
        
     }
    
    private func setup(){
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.edges.equalToSuperview().inset(12)
        }
        
        avatarImage.snp.makeConstraints {
            $0.size.equalTo(29)
        }
        
        nameLabel.snp.makeConstraints {
            $0.height.equalTo(22)
//            $0.width.equalTo(200)
        }
    }
    
    func configure(data: NewContacts) {
        avatarImage.image = UIImage(named: data.imageName)
        nameLabel.text = data.name
    }
    
    



}
