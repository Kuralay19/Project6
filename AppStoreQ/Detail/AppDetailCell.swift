//
//  AppDetailCell.swift
//  AppStoreQ
//
//  Created by Smart Castle M1A2004 on 09.12.2023.
//

import UIKit
class AppDetailCell : UICollectionViewCell {
    lazy var appImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "MONOPOLY "
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Match dice & collect"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var getButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Get", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    func setupUI() {
        
        addSubview(appImageView)
        appImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        appImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        appImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: appImageView.rightAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: appImageView.rightAnchor, constant: 10).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        addSubview(getButton)
        getButton.leftAnchor.constraint(equalTo: appImageView.rightAnchor, constant: 10).isActive = true
        getButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        getButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func configure(_ data: SearchResultModel?) {
        nameLabel.text = data?.trackName
        descriptionLabel.text = data?.artistName
        appImageView.downloaded(from: data?.artworkUrl100 ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
