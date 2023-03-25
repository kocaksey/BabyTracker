//
//  PremiumVC.swift
//  BabyTracker
//
//  Created by Seyhun Koçak on 15.03.2023.
//

import UIKit
import RevenueCat
import SnapKit

class PremiumVC: UIViewController {
    
    let weeklyBtn = UIButton()
    let monthlyBtn = UIButton()
    let annualBtn = UIButton()
    
    let headerLabel = UILabel()
    let moonImage = UIImageView()
    let info1Label = UILabel()
    let info2Label = UILabel()
    let info3Label = UILabel()
    let dotImage1 = UIImageView()
    let dotImage2 = UIImageView()
    let dotImage3 = UIImageView()
    let halfView = UIView()

    let timeLabel2 = UILabel()
    let costLabel2 = UILabel()
    let timeLabel3 = UILabel()
    let costLabel3 = UILabel()
    let startBtn = UIButton()
    let xImage = UIImageView()

    let selectedMonthlyImage = UIImageView()
    let selectedAnnualImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let isPremium = UserDefaults.standard.bool(forKey: "premium")
        print(isPremium)
        if isPremium {
            let vc = loginVC()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    func fetchPackages(offering: String, completion: @escaping(RevenueCat.Package) -> Void) {
        Purchases.shared.getOfferings { offerings, error in
            guard let offerings = offerings, error == nil else {return}
            guard let package = offerings.all.first?.value.package(identifier: offering) else {return}
            print(package)
            completion(package)
        }
        
    }
    func purchase(package: RevenueCat.Package) {
        Purchases.shared.purchase(package: package) { transaction, customerInfo, error, userCanceled in
            
            guard let transaction = transaction, let info = customerInfo, error == nil, !userCanceled else {return}
            
            if info.entitlements.all["pro"]?.isActive == true {
                print(info.entitlements)
   
            } else {

            }
            
            print(transaction.purchaseDate)
            print(info.entitlements)
        }
    }
    func restore(){
        Purchases.shared.restorePurchases { info, error in
            guard let info = info, error == nil else {return}
            if info.entitlements.all["pro"]?.isActive == true {
                print(info.entitlements)
                print("RESTORE SUCCESS")
            } else {
                print("RESTORE FAILED")
            }
        }
    }
    
    func setupUI(){
                view.backgroundColor = .white
                view.addSubview(headerLabel)
                view.addSubview(info1Label)
                view.addSubview(info2Label)
                view.addSubview(info3Label)
                view.addSubview(dotImage1)
                view.addSubview(dotImage2)
                view.addSubview(dotImage3)
                view.addSubview(halfView)
                view.addSubview(weeklyBtn)
                view.addSubview(monthlyBtn)
                view.addSubview(annualBtn)
                view.addSubview(startBtn)
                view.addSubview(xImage)
                view.addSubview(selectedMonthlyImage)
                view.addSubview(selectedAnnualImage)
                self.navigationItem.hidesBackButton = true
        
       
        weeklyBtn.setBackgroundImage(UIImage(named: "btn_Unselected"), for: .normal)
        weeklyBtn.addTarget(self, action: #selector(didTapWeekly), for: .touchUpInside)
        view.addSubview(weeklyBtn)
        
        weeklyBtn.snp.makeConstraints { make in
            make.top.equalTo(halfView.snp.top).offset(16)
            make.centerX.equalToSuperview()
        }
        
        let timeLabel1 = UILabel()
        timeLabel1.text = "Weekly"
        timeLabel1.font = .boldSystemFont(ofSize: 18)
        weeklyBtn.addSubview(timeLabel1)
        timeLabel1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(22)
            make.width.equalTo(68)
        }

        let costLabel1 = UILabel()
        costLabel1.text = "$10"
        costLabel1.font = .boldSystemFont(ofSize: 18)
        weeklyBtn.addSubview(costLabel1)
        costLabel1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-29)
            make.width.equalTo(35)
        }
        
        
        monthlyBtn.setBackgroundImage(UIImage(named: "btn_Unselected"), for: .normal)
        monthlyBtn.addTarget(self, action: #selector(didTapMonthly), for: .touchUpInside)
        view.addSubview(monthlyBtn)
        
        monthlyBtn.snp.makeConstraints { make in
            make.top.equalTo(weeklyBtn.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
        
        let timeLabel2 = UILabel()
        timeLabel2.text = "Monthly"
        timeLabel2.font = .boldSystemFont(ofSize: 18)
        monthlyBtn.addSubview(timeLabel2)
        timeLabel2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(22)
            make.width.equalTo(75)
        }

        let costLabel2 = UILabel()
        costLabel2.text = "$20"
        costLabel2.font = .boldSystemFont(ofSize: 18)
        monthlyBtn.addSubview(costLabel2)
        costLabel2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-29)
            make.width.equalTo(35)
        }
        
        annualBtn.setBackgroundImage(UIImage(named: "btn_Unselected"), for: .normal)
        annualBtn.addTarget(self, action: #selector(didTapAnnual), for: .touchUpInside)
        view.addSubview(annualBtn)
        
        annualBtn.snp.makeConstraints { make in
            make.top.equalTo(monthlyBtn.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
        
        let timeLabel3 = UILabel()
        timeLabel3.text = "Annual"
        timeLabel3.font = .boldSystemFont(ofSize: 18)
        annualBtn.addSubview(timeLabel3)
        timeLabel3.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(22)
            make.width.equalTo(75)
        }

        let costLabel3 = UILabel()
        costLabel3.text = "$30"
        costLabel3.font = .boldSystemFont(ofSize: 18)
        annualBtn.addSubview(costLabel3)
        costLabel3.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-29)
            make.width.equalTo(35)
        }

                        xImage.snp.makeConstraints { make in
                            make.top.equalToSuperview().offset(72)
                            make.trailing.equalToSuperview().inset(40)
                            make.height.width.equalTo(45)
                        }
                        xImage.image = UIImage(named: "btn_close")
                        xImage.isUserInteractionEnabled = true
                        let exitRecognizer = UITapGestureRecognizer(target: self, action: #selector(goBack))
                        xImage.addGestureRecognizer(exitRecognizer)
        
                        headerLabel.snp.makeConstraints { make in
                            make.top.equalToSuperview().offset(74)
                            make.leading.equalToSuperview().offset(123)
                            make.trailing.equalToSuperview().inset(124)
                            make.height.equalTo(41)
                        }
                        headerLabel.text = "Get Premium"
                        headerLabel.textColor = UIColor(rgb: 0x4625C3)
                        headerLabel.font = .boldSystemFont(ofSize: 27)
        
                        moonImage.image = UIImage(named: "img_4")
                        view.addSubview(moonImage)
                        moonImage.snp.makeConstraints { make in
                            make.top.equalTo(headerLabel.snp.bottom).offset(28)
                            make.leading.equalToSuperview().offset(120)
                            make.trailing.equalToSuperview().inset(160)
                            make.height.equalTo(100)
                        }
        
        
                        dotImage1.snp.makeConstraints { make in
                            make.leading.equalToSuperview().offset(104)
                            make.height.width.equalTo(33)
                            make.top.equalTo(moonImage.snp.bottom).offset(25)
                        }
                        dotImage1.image = UIImage(named: "icon_matter")
        
                        info1Label.snp.makeConstraints { make in
                            make.leading.equalTo(dotImage1.snp.trailing).offset(1)
                            make.centerY.equalTo(dotImage1.snp.centerY)
                            make.height.equalTo(26)
                            make.width.equalTo(109)
                        }
                        info1Label.text = "Share the care"
                        info1Label.font = .systemFont(ofSize: 16)
        
                        dotImage2.snp.makeConstraints { make in
                            make.leading.equalToSuperview().offset(104)
                            make.height.width.equalTo(33)
                            make.top.equalTo(dotImage1.snp.bottom).offset(2)
                        }
                        dotImage2.image = UIImage(named: "icon_matter")
        
                        info2Label.snp.makeConstraints { make in
                            make.leading.equalTo(dotImage2.snp.trailing).offset(1)
                            make.centerY.equalTo(dotImage2.snp.centerY)
                            make.height.equalTo(26)
                            make.width.equalTo(193)
                        }
                        info2Label.text = "All-in-one baby tracker"
                        info2Label.font = .systemFont(ofSize: 16)
        
                        dotImage3.snp.makeConstraints { make in
                            make.leading.equalToSuperview().offset(104)
                            make.height.width.equalTo(33)
                            make.top.equalTo(dotImage2.snp.bottom).offset(2)
                        }
                        dotImage3.image = UIImage(named: "icon_matter")
        
                        info3Label.snp.makeConstraints { make in
                            make.leading.equalTo(dotImage3.snp.trailing).offset(1)
                            make.centerY.equalTo(dotImage3.snp.centerY)
                            make.height.equalTo(26)
                            make.width.equalTo(193)
                        }
                        info3Label.text = "Watch your baby's growth"
                        info3Label.font = .systemFont(ofSize: 16)
        
                        halfView.snp.makeConstraints { make in
                            make.bottom.leading.trailing.equalToSuperview()
                            make.height.equalTo(view.frame.size.height * 0.56)
                        }
                        halfView.layer.cornerRadius = 25
                        halfView.layer.borderWidth = 1
                        halfView.layer.borderColor = UIColor(red: 235, green: 235, blue: 235).cgColor
        
                                startBtn.snp.makeConstraints { make in
                                    make.top.equalTo(annualBtn.snp.bottom).offset(38)
                                    make.leading.equalToSuperview().offset(27)
                                    make.trailing.equalToSuperview().offset(-28)
                                    make.height.equalTo(64)
        
                                }
                                startBtn.backgroundColor = UIColor(rgb: 0x4625C3)
                                startBtn.setTitle("Start", for: .normal)
                                startBtn.layer.cornerRadius = 25
                                startBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        startBtn.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)

                    }
    @objc func goToLogin(){
        let loginVC = loginVC()
        if weeklyBtn.currentBackgroundImage == monthlyBtn.currentBackgroundImage && weeklyBtn.currentBackgroundImage == annualBtn.currentBackgroundImage {

        }else {
            navigationController?.pushViewController(loginVC, animated: true)
        }
    }
    
                    @objc func goBack(){
                        navigationController?.popViewController(animated: true)
                    }
    
    
                    @objc  func didTapWeekly() {
                        weeklyBtn.setBackgroundImage(UIImage(named: "btn_selected"), for: .normal)
                        monthlyBtn.setBackgroundImage(UIImage(named: "btn_Unselected"), for: .normal)
                        annualBtn.setBackgroundImage(UIImage(named: "btn_Unselected"), for: .normal)
                        fetchPackages(offering: "$rc_weekly") { package in
                            self.purchase(package: package)
                        }

        
                    }
        
                    @objc func didTapMonthly(){
                        weeklyBtn.setBackgroundImage(UIImage(named: "btn_Unselected"), for: .normal)
                        monthlyBtn.setBackgroundImage(UIImage(named: "btn_selected"), for: .normal)
                        annualBtn.setBackgroundImage(UIImage(named: "btn_Unselected"), for: .normal)
                        fetchPackages(offering: "$rc_monthly") { package in
                            self.purchase(package: package)
                        }

                    }
        
                    @objc func didTapAnnual(){
                        weeklyBtn.setBackgroundImage(UIImage(named: "btn_Unselected"), for: .normal)
                        monthlyBtn.setBackgroundImage(UIImage(named: "btn_Unselected"), for: .normal)
                        annualBtn.setBackgroundImage(UIImage(named: "btn_selected"), for: .normal)
                        
                        fetchPackages(offering: "$rc_annual") { package in
                            self.purchase(package: package)
                        }
        
        
                    }
                }
