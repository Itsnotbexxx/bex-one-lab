//
//  addNewFriendsViewController.swift
//  MyFriends-MVVM-table&collectionView
//
//  Created by Бексултан Нурпейс on 17.04.2022.
//

import UIKit
import SnapKit

class addNewFriendsViewController: UIViewController {
    
    var newSection = 0
    private let items: [CellConfigurator] = [
        NewContacsCellConfigurator(item: NewContacts(imageName: "book", name: "From Contacts".localized())),
        NewContacsCellConfigurator(item: NewContacts(imageName: "signature", name: "By Username".localized())),
        NewContacsCellConfigurator(item: NewContacts(imageName: "phone", name: "By Phone Number".localized())),
        mightKnowTableViewCellConfigurator(item: MightKonwContacts(imageName: "avatar", nickName: "Itsnotbex", numName: "110.2M Friends".localized(), add: true)),
        mightKnowTableViewCellConfigurator(item: MightKonwContacts(imageName: "avatar", nickName: "FyoN-22", numName: "18 Friends".localized(), add: true)),
        mightKnowTableViewCellConfigurator(item: MightKonwContacts(imageName: "avatar", nickName: "Tim Wilkins", numName: "467 Friends".localized(), add: true)),
        mightKnowTableViewCellConfigurator(item: MightKonwContacts(imageName: "avatar", nickName: "KathMur96", numName: "12.3K Friends".localized(), add: true)),
        mightKnowTableViewCellConfigurator(item: MightKonwContacts(imageName: "avatar", nickName: "SavannahTucker", numName: "1298 Friends".localized(), add: true)),
        mightKnowTableViewCellConfigurator(item: MightKonwContacts(imageName: "avatar", nickName: "Jimmy", numName: "4.5K Friends".localized(), add: true)),
        mightKnowTableViewCellConfigurator(item: MightKonwContacts(imageName: "avatar", nickName: "Darrell Stewart", numName: "1100 Friends".localized(), add: true)),
        mightKnowTableViewCellConfigurator(item: MightKonwContacts(imageName: "avatar", nickName: "Itsnotbex", numName: "489 Friends".localized(), add: true))
    ]
    
    
    
    
    private let table: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New Friend".localized()
        view.backgroundColor = .systemBackground
        table.delegate = self
        table.dataSource = self
        
        setup()
    }
    
    private func setup(){
        view.addSubview(table)
        table.snp.makeConstraints {
            $0.right.left.equalToSuperview().inset(16)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension addNewFriendsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = items[indexPath.row]
        var item: CellConfigurator
        if indexPath.section == 0{
            item = items[indexPath.row]
        }else{
            item = items[indexPath.row + newSection]
        }
        table.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
        item.configure(cell: cell)
        cell.backgroundColor = .systemBackground
        
        return cell
    }
    
    
}

extension addNewFriendsViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleHeader: UILabel = {
            let title = UILabel()
            if section == 0 {
                title.text = NSLocalizedString("Add New Contacts".localized(), comment: "Add New Contacts")
                } else {
                    title.text = NSLocalizedString("You Might Know Them".localized(), comment: "You Might Know Them")
                }
            title.font = UIFont.systemFont(ofSize: 22, weight: .bold)
            return title
            }()
        titleHeader.backgroundColor = .systemBackground
        return titleHeader
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
        if section == 0 {
            newSection = items.filter { $0 is NewContacsCellConfigurator }.count
            return newSection
        }else{
            return items.filter { $0 is mightKnowTableViewCellConfigurator }.count
        }
    }
}


