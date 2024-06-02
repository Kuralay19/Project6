//
//  BannerCell.swift
//  AppStoreQ
//
//  Created by Smart Castle M1A2004 on 09.12.2023.
//

import UIKit
class BannerCell: UICollectionViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Announcing the 2023 App Store Awards"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .semibold)
     
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    lazy var contentImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.layer.masksToBounds = true
        imageview.layer.cornerRadius = 12
        imageview.backgroundColor = .yellow
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    func setupUI() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(contentImageView)
        contentImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        contentImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
