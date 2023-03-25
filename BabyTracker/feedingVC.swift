//
//  feedingVC.swift
//  BabyTracker
//
//  Created by Seyhun Koçak on 17.03.2023.
//

import UIKit
import SnapKit
import CoreData

class feedingVC: UIViewController, UITextViewDelegate {
    let noteTextView = UITextView()
    let amountField = UITextField()


    
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
        header.text = "Feeding"
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
        timeField.placeholder = "  Time"
        view.addSubview(timeField)
        timeField.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
            
        }
        amountField.placeholder = "  Amount(ml)"
        amountField.layer.cornerRadius = 25
        amountField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        view.addSubview(amountField)
        amountField.snp.makeConstraints { make in
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
            make.top.equalTo(amountField.snp.bottom).offset(29)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(264)
            
        }
        
        let saveBtn = UIButton()
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.backgroundColor = UIColor(rgb: 0x4625C3)
        saveBtn.layer.cornerRadius = 31
        saveBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        saveBtn.addTarget(self, action: #selector(saveFeedData), for: .touchUpInside)
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
    @objc func saveFeedData(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Feeding", into: context)
        
        saveData.setValue(String(timeField.text!), forKey: "time")
        saveData.setValue(String(amountField.text!), forKey: "amount")
        saveData.setValue(String(noteTextView.text!), forKey: "notes")

        
        do {
            try context.save()
            print("Success")

        } catch {
            print("Error")
        }
        
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
