//
//  ChatRoomCreatorCollectionViewCell.swift
//  KOLfanci
//
//  Created by cm0678 on 2022/10/18.
//

import UIKit

class ChatRoomCreateInfoCollectionViewCell: UICollectionViewCell {
    
    lazy var creatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var creatorNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .text50
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(creatorImageView)
        contentView.addSubview(creatorNameLabel)
        contentView.addSubview(dateLabel)
        
        activate([
            creatorImageView.widthAnchor.constraint(equalToConstant: 30),
            creatorImageView.heightAnchor.constraint(equalTo: creatorImageView.widthAnchor),
            creatorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            creatorImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            creatorNameLabel.centerYAnchor.constraint(equalTo: creatorImageView.centerYAnchor),
            creatorNameLabel.leadingAnchor.constraint(equalTo: creatorImageView.trailingAnchor, constant: 15),
            dateLabel.centerYAnchor.constraint(equalTo: creatorImageView.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: creatorNameLabel.trailingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -34)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
