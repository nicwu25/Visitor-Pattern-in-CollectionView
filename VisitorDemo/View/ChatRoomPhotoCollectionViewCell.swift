//
//  ChatRoomPhotoCollectionViewCell.swift
//  KOLfanci
//
//  Created by cm0678 on 2022/10/18.
//

import UIKit

class ChatRoomPhotoCollectionViewCell: UICollectionViewCell {
    
    lazy var photoImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(photoImageView)
        
        photoImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
