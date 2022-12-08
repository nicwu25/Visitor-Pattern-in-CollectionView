//
//  ChatRoomContentCollectionViewCell.swift
//  KOLfanci
//
//  Created by cm0678 on 2022/10/18.
//

import UIKit

class ChatRoomContentCollectionViewCell: UICollectionViewCell {
 
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .text80
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(contentLabel)
        contentLabel.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
