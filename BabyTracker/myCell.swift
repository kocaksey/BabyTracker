//
//  myCell.swift
//  BabyTracker
//
//  Created by Seyhun Koçak on 20.03.2023.
//

import UIKit
import SnapKit

class myCell: UITableViewCell {
    static let identifier = "myCell"
    var dateLabel = UILabel()
    var timeLabel = UILabel()
    var typeImage = UIImageView()
    var typeLabel = UILabel()

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setupUI(){
        
        let containerView = UIView()
        containerView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        containerView.layer.cornerRadius = 25
        addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.88)
            make.width.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        let calenderImage = UIImageView()
        addSubview(calenderImage)
        calenderImage.image = UIImage(named: "icon_calender2")
        calenderImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.leading.equalToSuperview().offset(6)
            
        }
        addSubview(dateLabel)
        dateLabel.text = "Tue, 12 Feb"
        dateLabel.font = .systemFont(ofSize: 22)
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(calenderImage.snp.trailing).offset(1)
            make.centerY.equalTo(calenderImage.snp.centerY)
            make.width.equalTo(112)
            make.height.equalTo(20)
        }
        let line = UIImageView()
        line.image = UIImage(named: "line")
        addSubview(line)
        line.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(56)
            make.width.equalTo(380)
            make.height.equalTo(1)
            make.centerX.equalToSuperview()
        }
        
        timeLabel.text = "12:12 AM"
        addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(26)
            make.trailing.equalToSuperview().inset(23)
            make.width.equalTo(70)
            make.height.equalTo(21)
        }
        addSubview(typeImage)
        typeImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(28)
            make.leading.equalToSuperview().offset(23)
            make.width.height.equalTo(15)
        }
        addSubview(typeLabel)
        typeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(typeImage.snp.centerY)
            make.leading.equalTo(typeImage.snp.trailing).offset(16)
            make.width.equalTo(120)
            make.height.equalTo(20)
        }
        
        
    }

}
