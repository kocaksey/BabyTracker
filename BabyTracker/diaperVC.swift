//
//  diaperVC.swift
//  BabyTracker
//
//  Created by Seyhun Koçak on 17.03.2023.
//

import UIKit
import SnapKit
import CoreData

class diaperVC: UIViewController, UITextViewDelegate {
    let noteTextView = UITextView()

    
    let dryView = UIImageView()
    let dryLabel = UILabel()
    let dropView = UIImageView()
    let wetLabel = UILabel()
    let dirtView = UIImageView()
    let dirtLabel = UILabel()
    let crossView = UIImageView()
    let crossLabel = UILabel()
    
    let timeField : UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        field.layer.cornerRadius = 25
        field.keyboardType = .numberPad
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.tintColor = .systemBlue
        datePicker.frame.size = CGSize(width: 0, height: 250)
        datePicker.locale = Locale.init(identifier: "en")
        field.inputView = datePicker
        datePicker.addTarget(self, action: #selector(valueTime), for: .valueChanged)
        return field
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

    }
    
    func setupUI(){
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let header = UILabel()
        header.text = "Diaper Change"
        header.textColor = UIColor(rgb: 0x4625C3)
        header.font = .boldSystemFont(ofSize: 27)
        view.addSubview(header)
        header.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(53)
            make.centerX.equalToSuperview()
            make.width.equalTo(208)
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
        
        timeField.placeholder = "  Time"
        timeField.layer.cornerRadius = 25
        timeField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        view.addSubview(timeField)
        timeField.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
            
        }
        
        let diaperLabel = UILabel()
        diaperLabel.text = "Diaper Status"
        diaperLabel.font = .boldSystemFont(ofSize: 15)
        view.addSubview(diaperLabel)
        diaperLabel.snp.makeConstraints { make in
            make.top.equalTo(timeField.snp.bottom).offset(27)
            make.leading.equalToSuperview().offset(48)
            make.width.equalTo(105)
            make.height.equalTo(23)
        }
        
        dropView.image = UIImage(named: "icon_wet_unselected")
        view.addSubview(dropView)
        dropView.contentMode = .scaleAspectFill
        dropView.isUserInteractionEnabled = true
        let dropRecognizer = UITapGestureRecognizer(target: self, action: #selector(dropBlue))
        dropView.addGestureRecognizer(dropRecognizer)
        dropView.snp.makeConstraints { make in
            make.top.equalTo(diaperLabel.snp.bottom).offset(19)
            make.leading.equalToSuperview().offset(48)
            make.height.equalTo(36)
            make.width.equalTo(22)
        }
        
        wetLabel.text = "Wet"
        wetLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)
        wetLabel.font = .boldSystemFont(ofSize: 15)
        wetLabel.isUserInteractionEnabled = true
        let dropRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(dropBlue))
        wetLabel.addGestureRecognizer(dropRecognizer2)
        view.addSubview(wetLabel)
        wetLabel.snp.makeConstraints { make in
            make.centerY.equalTo(dropView.snp.centerY)
            make.leading.equalTo(dropView.snp.trailing).offset(21)
            make.width.equalTo(30)
            make.height.equalTo(21)
            
        }
        
        dirtView.image = UIImage(named: "icon_dirty_unselected")
        view.addSubview(dirtView)
        dirtView.contentMode = .scaleAspectFill
        dirtView.isUserInteractionEnabled = true
        let dirtRecognizer = UITapGestureRecognizer(target: self, action: #selector(dirtBlue))
        dirtView.addGestureRecognizer(dirtRecognizer)
        dirtView.snp.makeConstraints { make in
            make.top.equalTo(dropView.snp.bottom).offset(23)
            make.leading.equalToSuperview().offset(48)
            make.height.equalTo(36)
            make.width.equalTo(22)
        }
        
        dirtLabel.text = "Dirty"
        dirtLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)
        dirtLabel.font = .boldSystemFont(ofSize: 15)
        view.addSubview(dirtLabel)
        dirtLabel.isUserInteractionEnabled = true
        let dirtRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(dirtBlue))
        dirtLabel.addGestureRecognizer(dirtRecognizer2)
        dirtLabel.snp.makeConstraints { make in
            make.centerY.equalTo(dirtView.snp.centerY)
            make.leading.equalTo(dirtView.snp.trailing).offset(21)
            make.width.equalTo(40)
            make.height.equalTo(21)
            
        }
        
        crossView.image = UIImage(named: "icon_mixed_unselected")
        view.addSubview(crossView)
        crossView.contentMode = .scaleAspectFill
        crossView.isUserInteractionEnabled = true
        let mixedRecognizer = UITapGestureRecognizer(target: self, action: #selector(mixedBlue))
        crossView.addGestureRecognizer(mixedRecognizer)
        crossView.snp.makeConstraints { make in
            make.top.equalTo(dirtView.snp.bottom).offset(23)
            make.leading.equalToSuperview().offset(48)
            make.height.equalTo(40)
            make.width.equalTo(24)
        }
        
        crossLabel.text = "Mixed"
        crossLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)
        crossLabel.font = .boldSystemFont(ofSize: 15)
        view.addSubview(crossLabel)
        crossLabel.isUserInteractionEnabled = true
        let mixedRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(mixedBlue))
        crossLabel.addGestureRecognizer(mixedRecognizer2)
        crossLabel.snp.makeConstraints { make in
            make.centerY.equalTo(crossView.snp.centerY)
            make.leading.equalTo(crossView.snp.trailing).offset(21)
            make.width.equalTo(45)
            make.height.equalTo(21)
            
        }
        
        dryView.image = UIImage(named: "icon_dry_unselected")
        view.addSubview(dryView)
        dryView.contentMode = .scaleAspectFill
        dryView.isUserInteractionEnabled = true
        let dryRecognizer = UITapGestureRecognizer(target: self, action: #selector(dryBlue))
        dryView.addGestureRecognizer(dryRecognizer)
        dryView.snp.makeConstraints { make in
            make.top.equalTo(crossView.snp.bottom).offset(23)
            make.leading.equalToSuperview().offset(48)
            make.height.equalTo(33)
            make.width.equalTo(33)
        }
        
        dryLabel.text = "Dry"
        dryLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)
        dryLabel.font = .boldSystemFont(ofSize: 15)
        dryLabel.isUserInteractionEnabled = true
        let dryRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(dryBlue))
        dryLabel.addGestureRecognizer(dryRecognizer2)
        view.addSubview(dryLabel)
        dryLabel.snp.makeConstraints { make in
            make.centerY.equalTo(dryView.snp.centerY)
            make.leading.equalTo(dryView.snp.trailing).offset(21)
            make.width.equalTo(45)
            make.height.equalTo(21)
        }
        
        noteTextView.delegate = self
        noteTextView.text = "  Note"
        noteTextView.font = .systemFont(ofSize: 16)
        noteTextView.textColor = UIColor.lightGray
        noteTextView.layer.cornerRadius = 25
        noteTextView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        view.addSubview(noteTextView)
        noteTextView.snp.makeConstraints { make in
            make.top.equalTo(dryView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(264)
            
        }
        
        let saveBtn = UIButton()
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.backgroundColor = UIColor(rgb: 0x4625C3)
        saveBtn.layer.cornerRadius = 31
        saveBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        saveBtn.addTarget(self, action: #selector(saveDiaperData), for: .touchUpInside)
        view.addSubview(saveBtn)
        saveBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(380)
            make.bottom.equalToSuperview().inset(69)
            make.height.equalTo(64)
        }

    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "  Note"
            textView.font = .systemFont(ofSize: 16)
            textView.textColor = UIColor.lightGray
        }
    }
    
    @objc func goBackHome(){
        dismiss(animated: true)
    }
    
    @objc func saveDiaperData(){
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Diaper", into: context)
        
        
        saveData.setValue(String(timeField.text!), forKey: "time")
        saveData.setValue(String(noteTextView.text!), forKey: "notes")

        do {
            try context.save()
            print("Success")

        } catch {
            print("Error")
        }
        
        
        
    }
    @objc func dryBlue(){
        dryView.image = UIImage(named: "icon_dry_selected")
        dryLabel.textColor = UIColor(rgb: 0x4625C3)
        
        dropView.image = UIImage(named: "icon_wet_unselected")
        wetLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)

        
        dirtView.image = UIImage(named: "icon_dirty_unselected")
        dirtLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)
        
        crossView.image = UIImage(named: "icon_mixed_unselected")
        crossLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)

        
    }
    @objc func dropBlue(){
        dropView.image = UIImage(named: "icon_wet_selected")
        dropView.contentMode = .scaleAspectFill
        wetLabel.textColor = UIColor(rgb: 0x4625C3)
        
        dirtView.image = UIImage(named: "icon_dirty_unselected")
        dirtLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)
        
        crossView.image = UIImage(named: "icon_mixed_unselected")
        crossLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)
        
        dryView.image = UIImage(named: "icon_dry_unselected")
        dryLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)
        
        

        
    }
    @objc func dirtBlue(){
        dirtView.image = UIImage(named: "icon_dirty_selected")
        dirtLabel.textColor = UIColor(rgb: 0x4625C3)
        
        crossView.image = UIImage(named: "icon_mixed_unselected")
        crossLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)
        
        dropView.image = UIImage(named: "icon_wet_unselected")
        wetLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)
        
        dryView.image = UIImage(named: "icon_dry_unselected")
        dryLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)


        
    }
    
    @objc func mixedBlue(){
        crossView.image = UIImage(named: "icon_mixed_selected")
        crossLabel.textColor = UIColor(rgb: 0x4625C3)
        
        dropView.image = UIImage(named: "icon_wet_unselected")
        wetLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)

        
        dirtView.image = UIImage(named: "icon_dirty_unselected")
        dirtLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)
        
        dryView.image = UIImage(named: "icon_dry_unselected")
        dryLabel.textColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1)

        
    }
    @objc func valueTime(sender: UIDatePicker){
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .long
        dateFormat.timeStyle = .none
        dateFormat.locale = Locale.init(identifier: "tr")
        dateFormat.dateFormat = "HH:mm"
        self.timeField.text = dateFormat.string(from: sender.date)
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
