//
//  homeVC.swift
//  BabyTracker
//
//  Created by Seyhun Koçak on 16.03.2023.
//

import UIKit
import SnapKit
import CoreData

class homeVC: UIViewController {
    
    let babyImage = UIImageView()
    let babyName = UILabel()
    let babyAge = UILabel()




    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true

        setupUI()
        getData()
    }
    
    func setupUI(){
        
        let setImage = UIImageView()
        setImage.image = UIImage(named: "btn_settings")
        view.addSubview(setImage)
        setImage.contentMode = .scaleToFill
        setImage.isUserInteractionEnabled = true
        let setRecognizer = UITapGestureRecognizer(target: self, action: #selector(goSet))
        setImage.addGestureRecognizer(setRecognizer)
        setImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(62)
            make.leading.equalToSuperview().offset(35)
            make.height.width.equalTo(40)
        }
        
        let calenderImage = UIImageView()
        calenderImage.image = UIImage(named: "btn_calender")
        view.addSubview(calenderImage)
        calenderImage.isUserInteractionEnabled = true
        let calenderRecognizer = UITapGestureRecognizer(target: self, action: #selector(goCalender))
        calenderImage.addGestureRecognizer(calenderRecognizer)
        calenderImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(63)
            make.trailing.equalToSuperview().inset(38)
            make.height.equalTo(44)
            make.width.equalTo(40)
        }
        let editLabel = UILabel()
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Edit Profile", attributes: underlineAttribute)
        editLabel.attributedText = underlineAttributedString
        editLabel.textColor = UIColor(rgb: 0x2D74FF)
        editLabel.isUserInteractionEnabled = true
        let editRecognizer = UITapGestureRecognizer(target: self, action: #selector(goEdit))
        editLabel.addGestureRecognizer(editRecognizer)
        view.addSubview(editLabel)
        editLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(146)
            make.centerX.equalToSuperview()
            make.width.equalTo(86)
            make.height.equalTo(20)
        }
        
        let feedImage = UIImageView()
        feedImage.image = UIImage(named: "feeding")
        view.addSubview(feedImage)
        feedImage.layer.cornerRadius = 14
        feedImage.isUserInteractionEnabled = true
        let feedRecognizer = UITapGestureRecognizer(target: self, action: #selector(goFeed))
        feedImage.addGestureRecognizer(feedRecognizer)
        
        
        feedImage.snp.makeConstraints { make in
            make.top.equalTo(editLabel.snp.bottom).offset(94)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(63)
        }
        let milkImage = UIImageView()
        milkImage.image = UIImage(named: "icon_feeding")
        feedImage.addSubview(milkImage)
        milkImage.contentMode = .scaleAspectFill
        milkImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.centerY.equalToSuperview()
            make.width.equalTo(25)
            make.height.equalTo(45)
        }
        let feedingLabel = UILabel()
        feedingLabel.text = "Feeding"
        feedingLabel.font = .boldSystemFont(ofSize: 22)
        feedingLabel.textColor = .white
        feedImage.addSubview(feedingLabel)
        feedingLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(90)
            make.height.equalTo(33)
            make.leading.equalTo(milkImage.snp.trailing).offset(18)
        }
        let diaperImage = UIImageView()
        diaperImage.image = UIImage(named: "diaper")
        view.addSubview(diaperImage)
        diaperImage.layer.cornerRadius = 14
        diaperImage.isUserInteractionEnabled = true
        let diaperRecognizer = UITapGestureRecognizer(target: self, action: #selector(goDiaper))
        diaperImage.addGestureRecognizer(diaperRecognizer)
        diaperImage.snp.makeConstraints { make in
            make.top.equalTo(feedImage.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(63)
        }
        let dipImage = UIImageView()
        dipImage.image = UIImage(named: "icon_diaper")
        diaperImage.addSubview(dipImage)
        dipImage.contentMode = .scaleAspectFill
        dipImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.centerY.equalToSuperview()
            make.width.equalTo(25)
            make.height.equalTo(45)
        }
        let dipLabel = UILabel()
        dipLabel.text = "Diaper Change"
        dipLabel.font = .boldSystemFont(ofSize: 22)
        dipLabel.textColor = .white
        diaperImage.addSubview(dipLabel)
        dipLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(170)
            make.height.equalTo(33)
            make.leading.equalTo(dipImage.snp.trailing).offset(18)
        }
        let sleepImage = UIImageView()
        sleepImage.image = UIImage(named: "sleep")
        sleepImage.isUserInteractionEnabled = true
        let sleepRecognizer = UITapGestureRecognizer(target: self, action: #selector(goSleep))
        sleepImage.addGestureRecognizer(sleepRecognizer)
        view.addSubview(sleepImage)
        sleepImage.layer.cornerRadius = 14
        sleepImage.snp.makeConstraints { make in
            make.top.equalTo(diaperImage.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(63)
        }
        let sleepIconImage = UIImageView()
        sleepIconImage.image = UIImage(named: "icon_sleep")
        sleepImage.addSubview(sleepIconImage)
        sleepIconImage.contentMode = .scaleAspectFill
        sleepIconImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.centerY.equalToSuperview()
            make.width.equalTo(25)
            make.height.equalTo(45)
        }
        let sleepLabel = UILabel()
        sleepLabel.text = "Sleep"
        sleepLabel.font = .boldSystemFont(ofSize: 22)
        sleepLabel.textColor = .white
        sleepImage.addSubview(sleepLabel)
        sleepLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(170)
            make.height.equalTo(33)
            make.leading.equalTo(sleepIconImage.snp.trailing).offset(18)
        }
        let photoImage = UIImageView()
        photoImage.image = UIImage(named: "img_photo")
        view.addSubview(photoImage)
        view.bringSubviewToFront(photoImage)
        photoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(59)
            make.height.width.equalTo(77)
        }
        view.addSubview(babyImage)
        babyImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(60)
            make.height.width.equalTo(75)
        }
        babyImage.clipsToBounds = true
        babyImage.layer.cornerRadius = 75 / 2
        
        babyName.font = .boldSystemFont(ofSize: 25)
        babyName.textColor = UIColor(rgb: 0x4625C3)
        babyName.textAlignment = .center
        view.addSubview(babyName)
        babyName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(editLabel.snp.bottom).offset(5)
            make.width.equalTo(140)
            make.height.equalTo(38)
        }
        babyAge.textAlignment = .center
        view.addSubview(babyAge)
        babyAge.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(babyName.snp.bottom).offset(-2)
            make.width.equalTo(100)
            make.height.equalTo(21)
        }
    }
    
    func getData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Baby")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject]{
                if let name = result.value(forKey: "name") as? String {
                    babyName.text = name
                }
                if let birth =  result.value(forKey: "birthDate") as? String {
                    babyAge.text = birth
                }
                if let image = result.value(forKey: "profileImage") as? Data {
                    babyImage.image = UIImage(data: image)
                }
            }
        }
            catch {
                print(error.localizedDescription)
                
            }
        }
    
    
    @objc func goCalender(){
        let calenderVC = calenderVC()
        calenderVC.modalPresentationStyle = .fullScreen
        present(calenderVC, animated: true)

    }
    @objc func goFeed(){
        let feedVC = feedingVC()
        feedVC.modalPresentationStyle = .fullScreen
        present(feedVC, animated: true)

    }
    
    @objc func goDiaper(){
        let diaperVC = diaperVC()
        diaperVC.modalPresentationStyle = .fullScreen
        present(diaperVC, animated: true)

    }
    @objc func goSleep(){
        let sleepVC = sleepVC()
        sleepVC.modalPresentationStyle = .fullScreen
        present(sleepVC, animated: true)

    }
    @objc func goEdit(){
        dismiss(animated: true)

    }
    
    @objc func goSet(){
        let setVC = settingVC()
        setVC.modalPresentationStyle = .fullScreen
        present(setVC, animated: true)
    }
    



}
