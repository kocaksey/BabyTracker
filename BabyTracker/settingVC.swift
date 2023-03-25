//
//  settingVC.swift
//  BabyTracker
//
//  Created by Seyhun Koçak on 20.03.2023.
//

import UIKit
import SnapKit

class settingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    func setupUI(){
        let header = UILabel()
        header.text = "Settings"
        header.textColor = UIColor(rgb: 0x4625C3)
        header.font = .boldSystemFont(ofSize: 27)
        view.addSubview(header)
        header.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(53)
            make.centerX.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(41)
        }
        let backBtn = UIButton()
        backBtn.setBackgroundImage(UIImage(named: "back"), for: .normal)
        backBtn.addTarget(self, action: #selector(goBackHome), for: .touchUpInside)
        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.leading.equalToSuperview().offset(42)
            make.height.equalTo(19)
            make.width.equalTo(11)
        }
        
        let premiumView = UIImageView()
        premiumView.image = UIImage(named: "img_premium")
        view.addSubview(premiumView)
        premiumView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(33)
            make.centerX.equalToSuperview()
            make.width.equalTo(380)
            make.height.equalTo(81)
        }
        let kingImage = UIImageView()
        kingImage.image = UIImage(named: "icon_crown")
        kingImage.contentMode = .scaleAspectFill
        premiumView.addSubview(kingImage)
        kingImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(25)
            make.width.equalTo(44)
            make.height.equalTo(34)
        }
        let kingLabel = UILabel()
        kingLabel.text = "Get Premium"
        kingLabel.font = .boldSystemFont(ofSize: 20)
        kingLabel.textColor = .white
        premiumView.addSubview(kingLabel)
        kingLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(kingImage.snp.trailing).offset(12)
        }
        let rightArrow = UIImageView()
        rightArrow.image = UIImage(named: "icon_right")
        premiumView.addSubview(rightArrow)
        rightArrow.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
            make.trailing.equalToSuperview().inset(7)
        }
        
        let empty1 = UIImageView()
        empty1.image = UIImage(named: "empty")
        view.addSubview(empty1)
        empty1.snp.makeConstraints { make in
            make.top.equalTo(premiumView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(380)
            make.height.equalTo(60)
        }
        let starImage = UIImageView()
        starImage.image = UIImage(named: "icon_rate")
        starImage.contentMode = .scaleAspectFill
        empty1.addSubview(starImage)
        starImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(25)
            make.width.equalTo(44)
            make.height.equalTo(34)
        }
        let starLabel = UILabel()
        starLabel.text = "Rate Us"
        starLabel.font = .boldSystemFont(ofSize: 14)
        empty1.addSubview(starLabel)
        starLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(kingImage.snp.trailing).offset(12)
        }
        let rightArrow1 = UIImageView()
        rightArrow1.image = UIImage(named: "icon_right_grey")
        empty1.addSubview(rightArrow1)
        rightArrow1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
            make.trailing.equalToSuperview().inset(7)
        }
        
        let empty2 = UIImageView()
        empty2.image = UIImage(named: "empty")
        view.addSubview(empty2)
        empty2.snp.makeConstraints { make in
            make.top.equalTo(empty1.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(380)
            make.height.equalTo(60)
        }
        let termsImage = UIImageView()
        termsImage.image = UIImage(named: "icon_terms")
        termsImage.contentMode = .scaleAspectFill
        empty2.addSubview(termsImage)
        termsImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(25)
            make.width.equalTo(44)
            make.height.equalTo(34)
        }
        let termsLabel = UILabel()
        termsLabel.text = "Terms of Use"
        termsLabel.font = .boldSystemFont(ofSize: 14)
        empty2.addSubview(termsLabel)
        termsLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(kingImage.snp.trailing).offset(12)
        }
        let rightArrow2 = UIImageView()
        rightArrow2.image = UIImage(named: "icon_right_grey")
        empty2.addSubview(rightArrow2)
        rightArrow2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
            make.trailing.equalToSuperview().inset(7)
        }
        
        let empty3 = UIImageView()
        empty3.image = UIImage(named: "empty")
        view.addSubview(empty3)
        empty3.snp.makeConstraints { make in
            make.top.equalTo(empty2.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(380)
            make.height.equalTo(60)
        }
        let privacyImage = UIImageView()
        privacyImage.image = UIImage(named: "icon_privacy")
        privacyImage.contentMode = .scaleAspectFill
        empty3.addSubview(privacyImage)
        privacyImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(25)
            make.width.equalTo(44)
            make.height.equalTo(34)
        }
        let privacyLabel = UILabel()
        privacyLabel.text = "Privacy Policy"
        privacyLabel.font = .boldSystemFont(ofSize: 14)
        empty3.addSubview(privacyLabel)
        privacyLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(kingImage.snp.trailing).offset(12)
        }
        let rightArrow3 = UIImageView()
        rightArrow3.image = UIImage(named: "icon_right_grey")
        empty3.addSubview(rightArrow3)
        rightArrow3.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
            make.trailing.equalToSuperview().inset(7)
        }
        let empty4 = UIImageView()
        empty4.image = UIImage(named: "empty")
        view.addSubview(empty4)
        empty4.snp.makeConstraints { make in
            make.top.equalTo(empty3.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(380)
            make.height.equalTo(60)
        }
        let contactImage = UIImageView()
        contactImage.image = UIImage(named: "icon_contact")
        contactImage.contentMode = .scaleAspectFill
        empty4.addSubview(contactImage)
        contactImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(25)
            make.width.equalTo(44)
            make.height.equalTo(34)
        }
        let contactLabel = UILabel()
        contactLabel.text = "Contact Us"
        contactLabel.font = .boldSystemFont(ofSize: 14)
        empty4.addSubview(contactLabel)
        contactLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(kingImage.snp.trailing).offset(12)
        }
        let rightArrow4 = UIImageView()
        rightArrow4.image = UIImage(named: "icon_right_grey")
        empty4.addSubview(rightArrow4)
        rightArrow4.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
            make.trailing.equalToSuperview().inset(7)
        }
        
        
        let empty5 = UIImageView()
        empty5.image = UIImage(named: "empty")
        view.addSubview(empty5)
        empty5.snp.makeConstraints { make in
            make.top.equalTo(empty4.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(380)
            make.height.equalTo(60)
        }
        let restoreImage = UIImageView()
        restoreImage.image = UIImage(named: "icon_restore")
        restoreImage.contentMode = .scaleAspectFill
        empty5.addSubview(restoreImage)
        restoreImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(25)
            make.width.equalTo(44)
            make.height.equalTo(34)
        }
        let restoreLabel = UILabel()
        restoreLabel.text = "Restore Purchase"
        restoreLabel.font = .boldSystemFont(ofSize: 14)
        empty5.addSubview(restoreLabel)
        restoreLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(kingImage.snp.trailing).offset(12)
        }
        let rightArrow5 = UIImageView()
        rightArrow5.image = UIImage(named: "icon_right_grey")
        empty5.addSubview(rightArrow5)
        rightArrow5.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
            make.trailing.equalToSuperview().inset(7)
        }
    }
    @objc func goBackHome(){
        dismiss(animated: true)
        print("asd")
    }
}
