//
//  sleepVC.swift
//  BabyTracker
//
//  Created by Seyhun Koçak on 17.03.2023.
//

import UIKit
import CoreData

class sleepVC: UIViewController, UITextViewDelegate {
    let noteTextView = UITextView()

    
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
    let wokeUpField : UITextField = {
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
        datePicker.addTarget(self, action: #selector(valueWokeTime), for: .valueChanged)
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
        header.text = "Sleep"
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
        timeField.placeholder = "  Fell Sleep"
        timeField.layer.cornerRadius = 25
        timeField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        view.addSubview(timeField)
        timeField.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
            
        }
        wokeUpField.placeholder = "  Woke Up"
        wokeUpField.layer.cornerRadius = 25
        wokeUpField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        view.addSubview(wokeUpField)
        wokeUpField.snp.makeConstraints { make in
            make.top.equalTo(timeField.snp.bottom).offset(29)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
            
        }
        
        noteTextView.delegate = self
        noteTextView.text = "  Note"
        noteTextView.font = .systemFont(ofSize: 16)
        noteTextView.textColor = UIColor.lightGray
        noteTextView.layer.cornerRadius = 25
        noteTextView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        view.addSubview(noteTextView)
        noteTextView.snp.makeConstraints { make in
            make.top.equalTo(wokeUpField.snp.bottom).offset(29)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(264)
            
        }
        
        let saveBtn = UIButton()
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.backgroundColor = UIColor(rgb: 0x4625C3)
        saveBtn.layer.cornerRadius = 31
        saveBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        saveBtn.addTarget(self, action: #selector(saveSleepData), for: .touchUpInside)
        view.addSubview(saveBtn)
        saveBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(380)
            make.bottom.equalToSuperview().inset(69)
            make.height.equalTo(64)
        }
        
    }
    @objc func saveSleepData(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Sleeping", into: context)
        
        
        saveData.setValue(String(timeField.text!), forKey: "time")
        saveData.setValue(String(wokeUpField.text!), forKey: "wokeUp")
        saveData.setValue(String(noteTextView.text!), forKey: "notes")

        do {
            try context.save()
            print("Success")

        } catch {
            print("Error")
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
    
    @objc func valueTime(sender: UIDatePicker){
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .long
        dateFormat.timeStyle = .none
        dateFormat.locale = Locale.init(identifier: "tr")
        dateFormat.dateFormat = "HH:mm"
        self.timeField.text = dateFormat.string(from: sender.date)
    }
    
    @objc func valueWokeTime(sender: UIDatePicker){
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .long
        dateFormat.timeStyle = .none
        dateFormat.locale = Locale.init(identifier: "tr")
        dateFormat.dateFormat = "HH:mm"
        self.wokeUpField.text = dateFormat.string(from: sender.date)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }



}
