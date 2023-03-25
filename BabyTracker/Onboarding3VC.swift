//
//  Onboarding3VC.swift
//  BabyTracker
//
//  Created by Seyhun Koçak on 14.03.2023.
//

import UIKit
import Hero

class Onboarding3VC: UIViewController {
    let onboarding3 = UIImageView()
    let headerLabel3 = UILabel()
    let nextBtn = UIButton()
    let slider3 = UIImageView()
    let infoLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        setupUI()
        self.hero.isEnabled = true


    }
    
    func setupUI(){
        
        view.addSubview(onboarding3)
        view.addSubview(nextBtn)
        view.addSubview(slider3)
        view.addSubview(infoLabel)
        view.addSubview(headerLabel3)
        
        
        onboarding3.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalToSuperview()
        }
        onboarding3.image = UIImage(named: "img_3")
        
        nextBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(82)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().inset(28)
            make.height.equalTo(64)
        }
  
        nextBtn.backgroundColor = UIColor(rgb: 0x4625C3)
        nextBtn.layer.cornerRadius = 25
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.addTarget(self, action: #selector(goToPremiumVC), for: .touchUpInside)
        
        
        slider3.snp.makeConstraints { make in
            make.bottom.equalTo(nextBtn.snp.top).offset(-40)
            make.centerX.equalToSuperview()
        }
        slider3.image = UIImage(named: "slider3")
        slider3.hero.id = "1"
        
        infoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(slider3.snp.top).offset(-68)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().inset(28)
            make.height.equalTo(84)
        }
        infoLabel.text = "Share access to your baby's tracker with family members, babysitters, or healthcare providers"
        infoLabel.textColor = .black
        infoLabel.numberOfLines = .zero
        infoLabel.font = .systemFont(ofSize: 22)
        infoLabel.textAlignment = .center
        
        headerLabel3.snp.makeConstraints { make in
            make.bottom.equalTo(infoLabel.snp.top).offset(-30)
            make.leading.equalToSuperview().offset(61)
            make.trailing.equalToSuperview().inset(62)
            make.height.equalTo(88)
        }
        headerLabel3.text = "Stay Connected with Caregivers"
        headerLabel3.font = .boldSystemFont(ofSize: 28)
        headerLabel3.textColor = .black
        headerLabel3.numberOfLines = .zero
        headerLabel3.textAlignment = .center
        
    }
    @objc func goToPremiumVC(){
        let premiumVC = PremiumVC()
        navigationController?.pushViewController(premiumVC, animated: true)
    }
    



}
