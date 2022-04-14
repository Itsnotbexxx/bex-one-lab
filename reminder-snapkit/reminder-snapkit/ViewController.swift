//
//  ViewController.swift
//  reminder-snapkit
//
//  Created by Бексултан Нурпейс on 11.04.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // First body
    private let headView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let headLabel: UILabel = {
        let label = UILabel()
        label.text = "Get Groceriec"
        label.font = label.font.withSize(20)
        return label
    }()
    
    //Second body
    
    private let secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Remind me on a day"
        label.font = label.font.withSize(18)
        label.textColor = .darkGray
        return label
    }()
    
    private let switchOn = UISwitch()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private let dataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        return label
    }()
    
    private let secondLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var datePicker: UIDatePicker = {
        let date = UIDatePicker()
        date.preferredDatePickerStyle = UIDatePickerStyle.wheels
        date.timeZone = NSTimeZone.local
        date.backgroundColor = UIColor.white
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_us")
        formatter.dateFormat = "EEEE, MMM d, yyyy, h:mm a"
        dataLabel.text = formatter.string(from: date.date)
        return date
    }()
    
    private let thirdLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private let lastSecondLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat"
        label.font = label.font.withSize(18)
        label.textColor = .darkGray
        return label
    }()
    
    // Third body
    private let thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "Remind me on a location"
        label.font = label.font.withSize(18)
        label.textColor = .darkGray
        return label
    }()

    private let thirdSwitchOn = UISwitch()
    

    
    // Bottom body
    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "Priority"
        label.font = label.font.withSize(18)
        label.textColor = .darkGray
        return label
    }()
    
    private let bottomLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    let items = ["None","!","!!","!!!"]
    
    lazy var segmentControl: UISegmentedControl = {
        let control = UISegmentedControl(items: items)
        control.selectedSegmentTintColor = .systemBlue
        control.layer.borderColor = UIColor.systemBlue.cgColor
        control.layer.borderWidth = 1
        control.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:UIColor.white],
            for: UIControl.State.selected)
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.systemBlue],
                                       for: UIControl.State.normal)
        return control
    }()
    
    private let secondBottomLabel: UILabel = {
        let label = UILabel()
        label.text = "Notes"
        label.font = label.font.withSize(18)
        label.textColor = .darkGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Create Reminder"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20,
                            weight: UIFont.Weight.bold)
        ]
        view.backgroundColor = .systemGray6
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .done,
            target: self,
            action: #selector(cancelTapped))
        setup()
    }
    private func setup(){
        // setup of First body
        view.addSubview(headView)
        headView.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalToSuperview().inset(120)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        headView.addSubview(headLabel)
        headLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        //setup of Second body
        view.addSubview(secondView)
        secondView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(headView.snp.bottom).offset(35)
            $0.height.equalTo(350)
        }
        
        secondView.addSubview(secondLabel)
        secondLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(12)
        }

        secondView.addSubview(switchOn)
        switchOn.snp.makeConstraints {
            $0.right.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(8)
            
        }
        
        secondView.addSubview(lineView)
        lineView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(16)
            $0.height.equalTo(1)
            $0.top.equalTo(secondLabel.snp.bottom).offset(10)
        }
        
        secondView.addSubview(dataLabel)
        dataLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.top.equalTo(secondLabel.snp.bottom).offset(20)
        }
        
        secondView.addSubview(secondLineView)
        secondLineView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(16)
            $0.height.equalTo(1)
            $0.top.equalTo(dataLabel.snp.bottom).offset(10)
        }
        
        secondView.addSubview(datePicker)
        datePicker.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(secondLineView.snp.bottom).offset(5)
        }
        
        secondView.addSubview(thirdLineView)
        thirdLineView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(16)
            $0.height.equalTo(1)
            $0.top.equalTo(datePicker.snp.bottom).offset(1)
        }
        
        secondView.addSubview(lastSecondLabel)
        lastSecondLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.top.equalTo(thirdLineView.snp.bottom).offset(10)
        }
        
        //setup of Third body
        
        view.addSubview(thirdView)
        thirdView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(50)
            $0.top.equalTo(secondView.snp.bottom).offset(40)
        }
        thirdView.addSubview(thirdLabel)
        thirdLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(10)
        }
        
        thirdView.addSubview(thirdSwitchOn)
        thirdSwitchOn.snp.makeConstraints {
            $0.right.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(8)
        }
        

        
        
        //setup of Bottom body
        
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(130)
            $0.top.equalTo(thirdView.snp.bottom).offset(40)
        }
        
        bottomView.addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(10)
        }
        bottomView.addSubview(segmentControl)
        segmentControl.snp.makeConstraints {
            $0.right.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(8)
        }
        
        bottomView.addSubview(bottomLineView)
        bottomLineView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(16)
            $0.height.equalTo(1)
            $0.top.equalTo(bottomLabel.snp.bottom).offset(10)
        }
        
        bottomView.addSubview(secondBottomLabel)
        secondBottomLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.top.equalTo(bottomLineView.snp.bottom).offset(10)
        }
    }
    
    
    @objc func doneTapped(){
        
    }
    
    @objc func cancelTapped(){
        
    }


}

