//
//  CharRoomCommentCollectionViewCell.swift
//  KOLfanci
//
//  Created by cm0678 on 2022/10/18.
//

import UIKit

class CharRoomCommentInfoCollectionViewCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .bg40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var creatorNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .text50
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .text100
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(containerView)
        containerView.addSubview(creatorNameLabel)
        containerView.addSubview(contentLabel)
        
        containerView.fillSuperview()
        activate([
            creatorNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            creatorNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            creatorNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            contentLabel.topAnchor.constraint(equalTo: creatorNameLabel.bottomAnchor, constant: 10),
            contentLabel.leadingAnchor.constraint(equalTo: creatorNameLabel.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: creatorNameLabel.trailingAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
