//
//  ChatRoomDateCollectionViewCell.swift
//  KOLfanci
//
//  Created by cm0678 on 2022/11/2.
//

import UIKit

class ChatRoomDateCollectionViewCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.backgroundColor = .base
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .text50
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(containerView)
        containerView.addSubview(dateLabel)
        
        activate([
            containerView.heightAnchor.constraint(equalToConstant: 35),
            containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            dateLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
