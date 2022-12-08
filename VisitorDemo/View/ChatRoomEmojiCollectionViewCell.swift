//
//  ChatRoomEmojiCollectionViewCell.swift
//  KOLfanci
//
//  Created by cm0678 on 2022/10/18.
//

import UIKit

class ChatRoomEmojiCollectionViewCell: UICollectionViewCell {

    lazy var emojiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .text80
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .base

        contentView.addSubview(emojiImageView)
        contentView.addSubview(countLabel)

        activate([
            emojiImageView.widthAnchor.constraint(equalToConstant: 18),
            emojiImageView.heightAnchor.constraint(equalTo: emojiImageView.widthAnchor),
            emojiImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            emojiImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            countLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            countLabel.leadingAnchor.constraint(equalTo: emojiImageView.trailingAnchor, constant: 5),
            countLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
