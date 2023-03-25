//
//  calenderVC.swift
//  BabyTracker
//
//  Created by Seyhun Koçak on 20.03.2023.
//

import UIKit
import CoreData

class calenderVC: UIViewController {
    let allImage = UIImageView()
    let feedingImage = UIImageView()
    let diaperImage = UIImageView()
    let sleepImage = UIImageView()
    var feedingData = [String](){
        didSet{
            tableView.reloadData()
        }
    }
    var sleepData = [String](){
        didSet{
            tableView.reloadData()
        }
    }
    var diaperData = [String](){
        didSet{
            tableView.reloadData()
        }
    }
    var allData = [Types](){
        didSet{
            tableView.reloadData()
        }
        
    }
    let tableView = UITableView()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

        feedGetData()
        sleepGetData()
        diaperGetData()
    }
    func feedGetData(){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Feeding")
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                for result in results as! [NSManagedObject]  {
                    let feedingTime = result.value(forKey: "time") as? String
                    feedingData.append(feedingTime ?? "veri gelmedi")
                    let tip = Types(image: "feeding_selected", type: "Feeding", time: feedingTime!)
                    allData.append(tip)
 
                }
            } catch  {
                print(error.localizedDescription)
            }

    }
    func sleepGetData(){
        
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Sleeping")
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                for result in results as! [NSManagedObject]  {
                    let sleepingTime = result.value(forKey: "time") as? String
                    sleepData.append(sleepingTime ?? "veri gelmedi")
                    let tip = Types(image: "sleeping_selected", type: "Sleep", time: sleepingTime!)
                    allData.append(tip)
                }
            } catch  {
                print(error.localizedDescription)
            }
    }
    func diaperGetData(){
        
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Diaper")
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                for result in results as! [NSManagedObject]  {
                    let diaperTime = result.value(forKey: "time") as? String
                    diaperData.append(diaperTime ?? "veri gelmedi")
                    let tip = Types(image: "diaper_selected", type: "Diaper Change", time: diaperTime!)
                    allData.append(tip)                }
            } catch  {
                print(error.localizedDescription)
            }
    }
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(myCell.self, forCellReuseIdentifier: myCell.identifier)
        tableView.separatorStyle = .none

        view.addSubview(tableView)

        let header = UILabel()
        header.text = "Calender"
        header.textColor = UIColor(rgb: 0x4625C3)
        header.font = .boldSystemFont(ofSize: 27)
        view.addSubview(header)
        header.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(53)
            make.centerX.equalToSuperview()
            make.width.equalTo(127)
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
        
        let dateLabel = UILabel()
        dateLabel.text = "Tue, Feb 12"
        dateLabel.font = .systemFont(ofSize: 20)
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(header.snp.bottom).offset(14)
            make.width.equalTo(102)
            make.height.equalTo(20)
        }
        
        allImage.image = UIImage(named: "text_all_selected")
        allImage.isUserInteractionEnabled = true
        let allRecognizer = UITapGestureRecognizer(target: self, action: #selector(allBlue))
        allImage.addGestureRecognizer(allRecognizer)
        view.addSubview(allImage)
        allImage.contentMode = .scaleAspectFill
        allImage.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(29)
            make.leading.equalToSuperview().offset(60)
            make.width.equalTo(45)
            make.height.equalTo(30)
        }
        
        feedingImage.image = UIImage(named: "icon_feeding_unselected")
        feedingImage.isUserInteractionEnabled = true
        let feedingRecognizer = UITapGestureRecognizer(target: self, action: #selector(feedingBlue))
        feedingImage.addGestureRecognizer(feedingRecognizer)
        view.addSubview(feedingImage)
        feedingImage.contentMode = .scaleAspectFill
        feedingImage.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.leading.equalTo(allImage.snp.trailing).offset(35)
            make.width.equalTo(22)
            make.height.equalTo(42)
        }
        
        diaperImage.image = UIImage(named: "icon_diaper_unselected")
        diaperImage.isUserInteractionEnabled = true
        let diaperRecognizer = UITapGestureRecognizer(target: self, action: #selector(diaperBlue))
        diaperImage.addGestureRecognizer(diaperRecognizer)
        view.addSubview(diaperImage)
        diaperImage.contentMode = .scaleAspectFill
        diaperImage.snp.makeConstraints { make in
            make.centerY.equalTo(allImage.snp.centerY)
            make.leading.equalTo(feedingImage.snp.trailing).offset(45)
            make.width.equalTo(42)
            make.height.equalTo(33)
        }
        
        sleepImage.image = UIImage(named: "icon_sleep_unselected")
        sleepImage.isUserInteractionEnabled = true
        let sleepRecognizer = UITapGestureRecognizer(target: self, action: #selector(sleepBlue))
        sleepImage.addGestureRecognizer(sleepRecognizer)
        view.addSubview(sleepImage)
        sleepImage.contentMode = .scaleAspectFill
        sleepImage.snp.makeConstraints { make in
            make.centerY.equalTo(diaperImage.snp.centerY)
            make.leading.equalTo(diaperImage.snp.trailing).offset(45)
            make.width.equalTo(48)
            make.height.equalTo(45)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(allImage.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(40)
        }
        
    }
    @objc func allBlue(){
        allImage.image = UIImage(named: "text_all_selected")
        sleepImage.image = UIImage(named: "icon_sleep_unselected")
        diaperImage.image = UIImage(named: "icon_diaper_unselected")
        feedingImage.image = UIImage(named: "icon_feeding_unselected")
        tableView.reloadData()
        
    }
    @objc func feedingBlue(){
        feedingImage.image = UIImage(named: "feeding_selected")
        allImage.image = UIImage(named: "text_all_unselected")
        sleepImage.image = UIImage(named: "icon_sleep_unselected")
        diaperImage.image = UIImage(named: "icon_diaper_unselected")
        tableView.reloadData()
        
    }
    @objc func diaperBlue(){
        diaperImage.image = UIImage(named: "diaper_selected")
        allImage.image = UIImage(named: "text_all_unselected")
        sleepImage.image = UIImage(named: "icon_sleep_unselected")
        feedingImage.image = UIImage(named: "icon_feeding_unselected")
        tableView.reloadData()


        
    }
    @objc func sleepBlue(){
        sleepImage.image = UIImage(named: "sleeping_selected")
        feedingImage.image = UIImage(named: "icon_feeding_unselected")
        diaperImage.image = UIImage(named: "icon_diaper_unselected")
        allImage.image = UIImage(named: "text_all_unselected")
        tableView.reloadData()

    }
    
    @objc func goBackHome(){
        dismiss(animated: true)
    }
}

extension calenderVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if sleepImage.image == UIImage(named: "sleeping_selected") {
            return sleepData.count
        } else if diaperImage.image == UIImage(named: "diaper_selected") {
            return diaperData.count
        } else if feedingImage.image == UIImage(named: "feeding_selected") {
            return feedingData.count }
        else if allImage.image == UIImage(named: "text_all_selected") {
            return allData.count}
        else
            {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myCell.identifier, for: indexPath) as! myCell
        
        if sleepImage.image == UIImage(named: "sleeping_selected") {
            DispatchQueue.main.async {
                cell.timeLabel.text = self.sleepData[indexPath.row]
                cell.typeImage.image = UIImage(named: "sleeping_selected")
                cell.typeLabel.text = "Sleep"
            }

        } else if diaperImage.image == UIImage(named: "diaper_selected") {
            DispatchQueue.main.async {
                cell.timeLabel.text = self.diaperData[indexPath.row]
                cell.typeImage.image = UIImage(named: "diaper_selected")
                cell.typeLabel.text = "Diaper Change"
            }

        } else if feedingImage.image == UIImage(named: "feeding_selected") {
            DispatchQueue.main.async {
                cell.timeLabel.text = self.feedingData[indexPath.row]
                cell.typeImage.image = UIImage(named: "feeding_selected")
                cell.typeLabel.text = "Feeding"
            }
        }
        else if allImage.image == UIImage(named: "text_all_selected") {
            DispatchQueue.main.async {
                cell.timeLabel.text = self.allData[indexPath.row].time
                cell.typeImage.image = UIImage(named: self.allData[indexPath.row].image)
                cell.typeLabel.text = self.allData[indexPath.row].type
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 133
    }
}
