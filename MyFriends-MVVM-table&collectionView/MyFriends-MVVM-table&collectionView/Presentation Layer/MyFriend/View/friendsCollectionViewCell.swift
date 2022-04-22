//
//  friendsCollectionViewCell.swift
//  MyFriends-MVVM-table&collectionView
//
//  Created by Бексултан Нурпейс on 18.04.2022.
//

import UIKit

class friendsCollectionViewCell: UICollectionViewCell {
    static let identifier = "friendsCollectionViewCell"
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, jobLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private let avatarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16)
        label.textAlignment = .center
        return label
    }()
    
    
    
    private let jobLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.backgroundColor = .systemBackground
            setup()
       }
    
    required init?(coder: NSCoder) {
            fatalError()
        }
    
    override func layoutSubviews() {
            super.layoutSubviews()
        }
    
    func setup(){
        contentView.addSubview(avatarImage)
        avatarImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.right.left.equalToSuperview().inset(30)
            $0.height.equalTo(100)
            $0.width.equalTo(100)
        }

        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(avatarImage.snp.bottom).offset(19)
            $0.left.right.equalToSuperview().inset(22)
        }
    }
    
    override func prepareForReuse() {
          super.prepareForReuse()
      }
    
    public func configure(with items: Friends){
        avatarImage.image = items.avatarImage
        nameLabel.text = items.nameLabel
        jobLabel.text = items.jobLabel
       }
}
