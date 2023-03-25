//
//  ViewController.swift
//  BabyTracker
//
//  Created by Seyhun Koçak on 14.03.2023.
//

import UIKit
import Hero

class ViewController: UIViewController {
    
    let onboarding1 = UIImageView()
    let headerLabel = UILabel()
    let nextBtn = UIButton()
    let slider1 = UIImageView()
    let infoLabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        setupUI()
    
    }
    
    
    func setupUI(){
        
        view.addSubview(onboarding1)
        view.addSubview(nextBtn)
        view.addSubview(slider1)
        view.addSubview(infoLabel)
        view.addSubview(headerLabel)
        
        
        onboarding1.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalToSuperview()
        }
        onboarding1.image = UIImage(named: "img_1")
        
        nextBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(82)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().inset(28)
            make.height.equalTo(64)
        }
  
        nextBtn.backgroundColor = UIColor(rgb: 0x4625C3)
        nextBtn.layer.cornerRadius = 25
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.addTarget(self, action: #selector(goTosecondVC), for: .touchUpInside)
        
        
        slider1.snp.makeConstraints { make in
            make.bottom.equalTo(nextBtn.snp.top).offset(-40)
            make.centerX.equalToSuperview()
        }
        slider1.image = UIImage(named: "slider1")
        slider1.hero.id = "1"
        
        infoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(slider1.snp.top).offset(-68)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().inset(28)
            make.height.equalTo(84)
        }
        infoLabel.text = "Get started with tracking your baby's feedings, diaper changes, sleep patterns, and more..."
        infoLabel.textColor = .black
        infoLabel.numberOfLines = .zero
        infoLabel.font = .systemFont(ofSize: 22)
        infoLabel.textAlignment = .center
        
        headerLabel.snp.makeConstraints { make in
            make.bottom.equalTo(infoLabel.snp.top).offset(-30)
            make.leading.equalToSuperview().offset(61)
            make.trailing.equalToSuperview().inset(62)
            make.height.equalTo(88)
        }
        headerLabel.text = "Track Your Baby's Activities with Ease"
        headerLabel.font = .boldSystemFont(ofSize: 28)
        headerLabel.textColor = .black
        headerLabel.numberOfLines = .zero
        headerLabel.textAlignment = .center
        
        
        
        
    }
    @objc func goTosecondVC(){
        let secondVC = Onboarding2VC()
        self.navigationController?.pushViewController(secondVC, animated: true)
      
    }
    


}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}



