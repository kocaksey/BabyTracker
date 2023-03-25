//
//  Onboarding2VC.swift
//  BabyTracker
//
//  Created by Seyhun Koçak on 14.03.2023.
//

import UIKit
import Hero

class Onboarding2VC: UIViewController {
    
    let onboarding2 = UIImageView()
    let headerLabel2 = UILabel()
    let nextBtn = UIButton()
    let slider2 = UIImageView()
    let infoLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setupUI()
        self.hero.isEnabled = true
    }
    
    func setupUI(){
        view.addSubview(onboarding2)
        view.addSubview(nextBtn)
        view.addSubview(slider2)
        view.addSubview(infoLabel)
        view.addSubview(headerLabel2)
        
        onboarding2.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalToSuperview()
        }
        onboarding2.image = UIImage(named: "img_2")
        
        nextBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(82)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().inset(28)
            make.height.equalTo(64)
        }
  
        nextBtn.backgroundColor = UIColor(rgb: 0x4625C3)
        nextBtn.layer.cornerRadius = 25
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.addTarget(self, action: #selector(goToThirdVC), for: .touchUpInside)
        
        
        slider2.snp.makeConstraints { make in
            make.bottom.equalTo(nextBtn.snp.top).offset(-40)
            make.centerX.equalToSuperview()
        }
        slider2.image = UIImage(named: "slider2")
        slider2.hero.id = "1"
        
        infoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(slider2.snp.top).offset(-68)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().inset(28)
            make.height.equalTo(84)
        }
        infoLabel.text = "Customize your baby's profile, set reminders for important activities, and view detailed reports on your baby's progress"
        infoLabel.textColor = .black
        infoLabel.numberOfLines = .zero
        infoLabel.font = .systemFont(ofSize: 22)
        infoLabel.textAlignment = .center
        
        headerLabel2.snp.makeConstraints { make in
            make.bottom.equalTo(infoLabel.snp.top).offset(-30)
            make.leading.equalToSuperview().offset(61)
            make.trailing.equalToSuperview().inset(62)
            make.height.equalTo(88)
        }
        headerLabel2.text = "Learn About Your Baby"
        headerLabel2.font = .boldSystemFont(ofSize: 28)
        headerLabel2.textColor = .black
        headerLabel2.numberOfLines = .zero
        headerLabel2.textAlignment = .center
        
    }
    
    @objc func goToThirdVC(){
        let thirdVC = Onboarding3VC()
        navigationController?.pushViewController(thirdVC, animated: true)
    }
}


