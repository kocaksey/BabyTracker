//
//  loginVC.swift
//  BabyTracker
//
//  Created by Seyhun Koçak on 16.03.2023.
//

import UIKit
import SnapKit
import CoreData

class loginVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let pickImage = UIButton()
    var boyImage = UIImageView()
    var girlImage = UIImageView()
    let imagePicker = UIImagePickerController()
    let nameField = UITextField()
    var isChild = Bool()

    
    let ageField: UITextField = {
        let field = UITextField()
        field.placeholder = "  Birth Date"
        field.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        field.layer.cornerRadius = 25
        field.keyboardType = .numberPad
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.tintColor = .systemBlue
        datePicker.frame.size = CGSize(width: 0, height: 250)
        field.inputView = datePicker
        datePicker.addTarget(self, action: #selector(valueBirthDate), for: .valueChanged)
      
        return field
    }()
    
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
    
    let dueField : UITextField = {
        let dueField = UITextField()
        dueField.placeholder = "  Due Date"
        dueField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        dueField.layer.cornerRadius = 25
        dueField.keyboardType = .numberPad
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.tintColor = .systemBlue
        datePicker.locale = Locale.init(identifier: "en")
        datePicker.frame.size = CGSize(width: 0, height: 250)
        dueField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(valueDueTime), for: .valueChanged)

        return dueField
    }()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        
  
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getData()
        
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
                    nameField.text = name
                }
                if let birth =  result.value(forKey: "birthDate") as? String {
                    ageField.text = birth
                }
                if let birthTime =  result.value(forKey: "birthTime") as? String {
                    timeField.text = birthTime
                }
                if let dueTime =  result.value(forKey: "dueTime") as? String {
                    dueField.text = dueTime
                }
                if let image = result.value(forKey: "profileImage") as? Data {
                    pickImage.setImage(UIImage(data: image), for: .normal)
                }
                if let boygilr = result.value(forKey: "isChild") as? Bool {
                    if boygilr {
                        boyImage.image = UIImage(named: "img_selected_boy")
                        girlImage.image = UIImage(named: "img_unselected_girl")
                        
                    } else {
                        girlImage.image = UIImage(named: "img_selected_girl")
                        boyImage.image = UIImage(named: "img_unselected_boy")
                    }
                }
            }
        }
            catch {
                print(error.localizedDescription)
                
            }
        }
    func setupUI(){
        self.navigationItem.hidesBackButton = true
        
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
        let screenWidth = view.frame.size.width
        let screenHeight = view.frame.size.height
        pickImage.contentMode = .scaleAspectFit
        pickImage.setImage(UIImage(named: "btn_addphoto"), for: .normal)
        pickImage.isUserInteractionEnabled = true
        let galleryRecognizer = UITapGestureRecognizer(target: self, action: #selector(openGallery))
        pickImage.addGestureRecognizer(galleryRecognizer)
        view.addSubview(pickImage)
        pickImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(83)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(134)
        }
        pickImage.clipsToBounds = true
        pickImage.layer.cornerRadius = 134 / 2
        
        let borderImage = UIImageView()
        borderImage.image = UIImage(named: "btn_addphoto-1")
        view.addSubview(borderImage)
        view.bringSubviewToFront(borderImage)
        borderImage.snp.makeConstraints { make in
            make.center.equalTo(pickImage.snp.center)
            
            make.width.height.equalTo(136)
        }
        
        
        let screenView = UIView()
        screenView.layer.cornerRadius = 25
        screenView.layer.borderColor = UIColor(red: 241, green: 241, blue: 241).cgColor
        screenView.layer.borderWidth = 1
        view.addSubview(screenView)
        screenView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(screenHeight * 0.71)
        }
        
        girlImage.image = UIImage(named: "img_unselected_girl")
        girlImage.contentMode = .scaleAspectFit
        view.addSubview(girlImage)
        girlImage.isUserInteractionEnabled = true
        let girlRecognizer = UITapGestureRecognizer(target: self, action: #selector(colorfulGirl))
        girlImage.addGestureRecognizer(girlRecognizer)
        
        girlImage.snp.makeConstraints { make in
            make.top.equalTo(screenView.snp.top).offset(26)
            make.leading.equalToSuperview().offset(screenWidth * 0.32)
            make.width.height.equalTo(42)
        }
        
        boyImage.image = UIImage(named: "img_unselected_boy")
        boyImage.contentMode = .scaleAspectFit
        view.addSubview(boyImage)
        boyImage.isUserInteractionEnabled = true
        let boyRecognizer = UITapGestureRecognizer(target: self, action: #selector(colorfulBoy))
        boyImage.addGestureRecognizer(boyRecognizer)
        boyImage.snp.makeConstraints { make in
            make.top.equalTo(screenView.snp.top).offset(26)
            make.trailing.equalToSuperview().inset(screenWidth * 0.32)
        }
        
        nameField.placeholder = "  Baby Full Name"
        nameField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        nameField.layer.cornerRadius = 25
        nameField.autocorrectionType = .no
        view.addSubview(nameField)
        nameField.snp.makeConstraints { make in
            make.top.equalTo(girlImage.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
        
        view.addSubview(ageField)

        ageField.snp.makeConstraints { make in
            make.top.equalTo(nameField.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
        view.addSubview(timeField)
        timeField.placeholder = "  Time of Birth"

        timeField.snp.makeConstraints { make in
            make.top.equalTo(ageField.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
        

        view.addSubview(dueField)
        dueField.snp.makeConstraints { make in
            make.top.equalTo(timeField.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
        
        let continueBtn = UIButton()
        continueBtn.backgroundColor = UIColor(rgb: 0x4625C3)
        continueBtn.setTitle("Continue", for: .normal)
        view.addSubview(continueBtn)
        continueBtn.snp.makeConstraints { make in
            make.top.equalTo(dueField.snp.bottom).offset(54)
            make.centerX.equalToSuperview()
            make.height.equalTo(64)
            make.width.equalTo(380)
        }
        continueBtn.layer.cornerRadius = 31
        continueBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        continueBtn.addTarget(self, action: #selector(goHome), for: .touchUpInside)
    }
    
    @objc func valueBirthDate(sender: UIDatePicker){
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .long
        dateFormat.timeStyle = .none
        dateFormat.dateFormat = "dd.MM.yyyy"
        self.ageField.text = dateFormat.string(from: sender.date)
    }
    
    
    @objc func valueTime(sender: UIDatePicker){
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .long
        dateFormat.timeStyle = .none
        dateFormat.locale = Locale.init(identifier: "tr")
        dateFormat.dateFormat = "HH:mm"
        self.timeField.text = dateFormat.string(from: sender.date)
    }
    @objc func valueDueTime(sender: UIDatePicker){
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .long
        dateFormat.timeStyle = .none
        dateFormat.locale = Locale.init(identifier: "tr")
        dateFormat.dateFormat = "HH:mm"
        self.dueField.text = dateFormat.string(from: sender.date)
    }
    @objc func goHome(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Baby", into: context)
        
        saveData.setValue(String(nameField.text!), forKey: "name")
        saveData.setValue(String(ageField.text!), forKey: "birthDate")
        saveData.setValue(String(timeField.text!), forKey: "birthTime")
        saveData.setValue(String(dueField.text!), forKey: "dueTime")
        let imagePress = pickImage.currentImage?.jpegData(compressionQuality: 0.5)
        saveData.setValue(imagePress, forKey: "profileImage")
        
        if boyImage.image == UIImage(named: "img_selected_boy"){
            saveData.setValue(true, forKey: "isChild")
        } else if girlImage.image == UIImage(named: "img_selected_girl") {
            
            saveData.setValue(false, forKey: "isChild")
        }
       


        do {
            try context.save()
            print("Success")

        } catch {
            print("Error")
        }
        
        let homeVC = homeVC()
//        homeVC.babyImage.image = pickImage.image
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true)
    }
    @objc func openGallery(){
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        pickImage.setImage(image, for: .normal)
        
        dismiss(animated: true)
    }
    @objc func colorfulGirl(){
        girlImage.image = UIImage(named: "img_selected_girl")
        boyImage.image = UIImage(named: "img_unselected_boy")
        
    }
    @objc func colorfulBoy(){
        boyImage.image = UIImage(named: "img_selected_boy")
        girlImage.image = UIImage(named: "img_unselected_girl")
        
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
