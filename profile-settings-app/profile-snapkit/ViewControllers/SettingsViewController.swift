//
//  SettingsViewController.swift
//  profile-snapkit
//
//  Created by Бексултан Нурпейс on 12.04.2022.
//

import UIKit
import SnapKit

struct Section{
    let options:[ModelType]
}

enum ModelType{
    case switchCell(model: SwitchModel)
    case iconCell(model: IconModel)
    case exitCell(model: ExitModel)
}

struct SwitchModel{
    let title: String
    var isOn: Bool
    let handler: (() -> Void)
}

struct IconModel{
    let title: String
    let icon: UIImage?
    let handler: (() -> Void)
}

struct ExitModel{
    let title: String
    let handler: (() -> Void)
}

class SettingsViewController: UIViewController {

    
    //head body
    private let headView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return view
    }()
    
    private let profilePhoto: UIImageView = {
        let profilePhoto = UIImageView(image: UIImage(named: "ava"))
        profilePhoto.contentMode = .scaleAspectFill
        return profilePhoto
    }()
    
    private let bluePhoto: UIImageView = {
        let photo = UIImageView(image: UIImage(named: "blue"))
        
        return photo
    }()
    
    private let changePhoto: UIImageView = {
        let photo = UIImageView(image: UIImage(named: "camera"))
        return photo
    }()
    
    private let headLabel: UILabel = {
        let label = UILabel()
        label.text = "Мария Атрисова"
        label.font = UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 16), size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 0.217, green: 0.217, blue: 0.217, alpha: 1)
        return label
    }()
    
    private let secondHeadLabel: UILabel = {
        let label = UILabel()
        label.text = "maria.atrisova@gmail.com"
        label.font = UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 14), size: 14)
        label.textColor = UIColor(red: 0.371, green: 0.371, blue: 0.371, alpha: 1)
        return label
    }()
    
    //list of settings
    
  
    var models = [Section]()
    
    private let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(IconTableViewCell.self, forCellReuseIdentifier: IconTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        table.register(ExitTableViewCell.self, forCellReuseIdentifier: ExitTableViewCell.identifier)
        table.isScrollEnabled = false
        table.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        table.sectionIndexBackgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        table.sectionIndexBackgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return table
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        self.navigationItem.title = "Профиль"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 16), size: 16)]
        table.dataSource = self
        table.delegate = self
        setUpSettings()
        configure()
       
    }
    
    func configure(){
        models.append(Section(options: [
            .switchCell(model: SwitchModel(title: "Push уведомления", isOn: true, handler: {
                print("")
            })),
        ]))
        models.append(Section(options: [
            .iconCell(model: IconModel(title: "Изменить пароль", icon: UIImage(named: "Arrow"), handler: {
                print("Change pass")
                let vc = ChangePasswordViewController()
                vc.navigationItem.largeTitleDisplayMode = .never
                self.navigationController?.pushViewController(vc, animated: true)
            })),
        ]))
        models.append(Section(options: [
            .iconCell(model: IconModel(title: "Изменить код быстрого доступа", icon: UIImage(named: "Arrow"), handler: {
                print("Change pass")
            })),
        ]))
        models.append(Section(options: [
            .switchCell(model: SwitchModel(title: "Вход c Face/Touch ID", isOn: true, handler: {
                print("")
            })),
        ]))
        models.append(Section(options: [
            .iconCell(model: IconModel(title: "Изменить номер телефона", icon: UIImage(named: "Arrow"), handler: {
                print("Change number")
            })),
        ]))
        models.append(Section(options: [
            .exitCell(model: ExitModel(title: "Выход", handler: {
                print("Exit")
            }))
        ]))
    }
    
    func setUpSettings(){
        // setup of head body
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(didTapChangeProfilePic))
        bluePhoto.addGestureRecognizer(gesture)
        bluePhoto.isUserInteractionEnabled = true
        
        view.addSubview(headView)
        headView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(170)
            $0.top.equalToSuperview().inset(100)
        }
    
        headView.addSubview(profilePhoto)
        profilePhoto.snp.makeConstraints {
            $0.left.equalToSuperview().inset(125)
            $0.right.equalToSuperview().inset(125)
            $0.top.equalToSuperview().inset(1)
        }
        
        
        headView.addSubview(bluePhoto)
        bluePhoto.addSubview(changePhoto)
        bluePhoto.snp.makeConstraints {
            $0.right.equalToSuperview().inset(150)
            $0.bottom.equalTo(profilePhoto.snp.bottom).inset(5)
        }
        
        changePhoto.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        headView.addSubview(headLabel)
        headLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(130)
            $0.top.equalTo(profilePhoto.snp.bottom).offset(15)
        }
        
        headView.addSubview(secondHeadLabel)
        secondHeadLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(115)
            $0.top.equalTo(headLabel.snp.bottom).offset(4)
        }
        
        //setup of list of settings
        
        view.addSubview(table)
        table.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(headView.snp.bottom).offset(15)
            $0.height.equalTo(341)
        }
    }
    
    @objc  func didTapChangeProfilePic() {
        presentPhotoActionSheet()

       }
    
    @objc func openChangePassword(){
        print("open")
    }
    
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self{
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath) as? SwitchTableViewCell else{
                return UITableViewCell()
            }
            
            cell.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

            cell.configure(with: model)
            return cell
        case .iconCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: IconTableViewCell.identifier,
                for: indexPath) as? IconTableViewCell else{
                return UITableViewCell()
            }
            cell.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            cell.configure(with: model)
            return cell
        case .exitCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ExitTableViewCell.identifier,
                for: indexPath) as? ExitTableViewCell else{
                return UITableViewCell()
            }
            cell.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self{
        case .switchCell(let model):
            model.handler()
        case .iconCell(let model):
            model.handler()
        case .exitCell(let model):
            model.handler()
        }
    }
}


extension SettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func presentPhotoActionSheet(){
        let actionSheet = UIAlertController(title: "Фото профили",
                                                  message: "Выберите одно?",
                                                  preferredStyle: .actionSheet)
              actionSheet.addAction(UIAlertAction(title: "Отмена",
                                                  style: .cancel,
                                                  handler: nil))
              actionSheet.addAction(UIAlertAction(title: "Открыть камеру",
                                                  style: .default,
                                                  handler: { [weak self] _ in

                                                      self?.presentCamera()

              }))
              actionSheet.addAction(UIAlertAction(title: "Открыть галерею",
                                                  style: .default,
                                                  handler: { [weak self] _ in

                                                      self?.presentPhotoPicker()

              }))

              present(actionSheet, animated: true)
    }
    func presentCamera(){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    func presentPhotoPicker(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = false
        present(vc, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }

        self.profilePhoto.image = selectedImage
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
