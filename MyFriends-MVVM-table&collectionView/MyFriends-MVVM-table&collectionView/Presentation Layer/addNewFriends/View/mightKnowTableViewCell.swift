//
//  mightKnowTableViewCell.swift
//  MyFriends-MVVM-table&collectionView
//
//  Created by Бексултан Нурпейс on 21.04.2022.
//

import UIKit

typealias mightKnowTableViewCellConfigurator = TableCellConfigurator<mightKnowTableViewCell, MightKonwContacts>


class mightKnowTableViewCell: UITableViewCell, configCell{
   
    private let avatarImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private let numOfFriendsLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(13)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nicknameLabel, numOfFriendsLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 15.0
        button.clipsToBounds = true
        button.backgroundColor = .systemBackground
        button.addTarget(self, action: #selector(clickAddButton), for: .touchUpInside)
        return button
    }()
    
    private let addLabel: UILabel = {
        let label = UILabel()
        label.text = "ADD"
        label.textColor = .systemBlue
        return label
    }()
    
    private let addImageview: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "plus")
        return imageView
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
        contentView.addSubview(avatarImage)
        avatarImage.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.size.equalTo(48)
            $0.top.bottom.equalToSuperview().inset(18)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.left.equalTo(avatarImage.snp.right).offset(12)
            $0.top.bottom.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(addButton)
        addButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(10)
            $0.width.equalTo(71)
            $0.height.equalTo(28)
            $0.top.bottom.equalToSuperview().inset(22)
        }
        
        addButton.addSubview(addLabel)
        addLabel.snp.makeConstraints {
            $0.right.equalToSuperview().inset(5)
//            $0.width.equalTo(29)
//            $0.height.equalTo(18)
            $0.top.bottom.equalToSuperview()
        }
        
        addButton.addSubview(addImageview)
        addImageview.snp.makeConstraints {
            $0.left.equalToSuperview()
//            $0.width.equalTo(29)
//            $0.height.equalTo(18)
            $0.top.bottom.equalToSuperview()
        }
    }
    
    func configure(data: MightKonwContacts) {
        avatarImage.image = UIImage(named: data.imageName)
        nicknameLabel.text = data.nickName
        numOfFriendsLabel.text = data.numName
        addButton.isOpaque = data.add
    }
    
    
    @objc func clickAddButton(){
        print("change")
        if addButton.tag == 1 {
            addLabel.text = "ADDED"
        }
    }
}
