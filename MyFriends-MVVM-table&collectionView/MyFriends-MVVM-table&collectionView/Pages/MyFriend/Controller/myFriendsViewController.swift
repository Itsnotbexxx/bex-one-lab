//
//  myFriendsViewController.swift
//  MyFriends-MVVM-table&collectionView
//
//  Created by Бексултан Нурпейс on 17.04.2022.
//

import UIKit
import SnapKit

class myFriendsViewController: UIViewController {

    private let items: [Friends] = [
        Friends(avatarImage: UIImage(named: "avatar"), nameLabel: "Nurpeiis Bexultan", jobLabel: "iOS Developer".localized()),
        Friends(avatarImage: UIImage(named: "avatar"), nameLabel: "NKathryn Murphy", jobLabel: "Photographer".localized()),
        Friends(avatarImage: UIImage(named: "avatar"), nameLabel: "Darrell Stewart", jobLabel: "UI/UX Designer".localized()),
        Friends(avatarImage: UIImage(named: "avatar"), nameLabel: "Jenny Wilson", jobLabel: "Model, Actress".localized()),
        Friends(avatarImage: UIImage(named: "avatar"), nameLabel: "Courtney Henry", jobLabel: "Taxi Driver".localized()),
        Friends(avatarImage: UIImage(named: "avatar"), nameLabel: "Jim Warren", jobLabel: "Company CEO".localized()),
        Friends(avatarImage: UIImage(named: "avatar"), nameLabel: "Savannah Tucker", jobLabel: "Retail Supervisor".localized()),
        Friends(avatarImage: UIImage(named: "avatar"), nameLabel: "Khamzat Chimaev", jobLabel: "UFC Fighter".localized())
        
    ]


    private let mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        collectionViewFlowLayout.minimumLineSpacing = 10
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.navigationItem.title = "My Friends".localized()
        self.navigationController?.navigationBar.titleTextAttributes = [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17,
                                    weight: UIFont.Weight.semibold)]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(didSearchTap)
        )
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didAddTapp)
        )
        mainCollectionView.register(
            friendsCollectionViewCell.self,
            forCellWithReuseIdentifier: friendsCollectionViewCell.identifier
        )
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        setup()
    }
    
    func setup(){
        view.addSubview(mainCollectionView)
        mainCollectionView.snp.makeConstraints {
            $0.right.left.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    @objc func didSearchTap(){
    
    }
    
    @objc func didAddTapp(){
        let vc = addNewFriendsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension myFriendsViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = mainCollectionView.dequeueReusableCell(
            withReuseIdentifier: friendsCollectionViewCell.identifier,
            for: indexPath
        ) as! friendsCollectionViewCell
        cell.contentView.layer.cornerRadius = 12.0
        cell.configure(with: item)
        return cell
    }


}

extension myFriendsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

}

extension myFriendsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - 3 * 10) / 2
        let height = width
        return CGSize(width: width, height: height)
    }
}


    
