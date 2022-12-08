//
//  ChatRoomMessageVisitor.swift
//  KOLfanci
//
//  Created by cm0678 on 2022/10/25.
//

import UIKit

protocol ChatRoomMessageVisitable {
    @discardableResult func accept<V: ChatRoomMessageVisitor>(visitor: V) -> V.T?
}

protocol ChatRoomMessageVisitor {
    associatedtype T
    func visit(_ viewObject: CreateInfoViewObject) -> T?
    func visit(_ viewObject: CommentInfoViewObject) -> T?
    func visit(_ viewObject: ContentViewObject) ->T?
    func visit(_ viewObject: LinkViewObject) -> T?
    func visit(_ viewObject: PhotoViewObject) -> T?
    func visit(_ viewObject: EmojiViewObject) -> T?
    func visit(_ viewObject: DateViewObject) -> T?
}

class ChatRoomMessageCollectionViewLayoutVisitor: ChatRoomMessageVisitor {
    
    private let leadingPadding: CGFloat = 68
    private let trailingPadding: CGFloat = 40
    private let bottomPadding: CGFloat = 10
    
    func visit(_ viewObject: CreateInfoViewObject) -> NSCollectionLayoutGroup? {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                             heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                        heightDimension: .absolute(45)),
                                                     subitems: [item])
        return group
    }
    
    func visit(_ viewObject: CommentInfoViewObject) -> NSCollectionLayoutGroup? {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                             heightDimension: .estimated(1000)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                        heightDimension: .estimated(1000)),
                                                     subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: leadingPadding, bottom: 0, trailing: trailingPadding)
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: nil, trailing: nil, bottom: .fixed(bottomPadding))
        
        return group
    }
    
    func visit(_ viewObject: ContentViewObject) -> NSCollectionLayoutGroup? {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                             heightDimension: .estimated(1000)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                        heightDimension: .estimated(1000)),
                                                     subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: leadingPadding, bottom: 0, trailing: trailingPadding)
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: nil, trailing: nil, bottom: .fixed(bottomPadding))
        
        return group
    }
    
    func visit(_ viewObject: LinkViewObject) -> NSCollectionLayoutGroup? {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                             heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                        heightDimension: .estimated(250)),
                                                     subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: leadingPadding, bottom: 0, trailing: trailingPadding)
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: nil, trailing: nil, bottom: .fixed(bottomPadding))
        
        return group
    }
    
    func visit(_ viewObject: PhotoViewObject) -> NSCollectionLayoutGroup? {
        let width: CGFloat = 200
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                             heightDimension: .fractionalHeight(1.0)))
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .absolute(width))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitems: [item])
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(leadingPadding), top: nil, trailing: nil, bottom: .fixed(10))
        
        return group
    }
    
    func visit(_ viewObject: EmojiViewObject) -> NSCollectionLayoutGroup? {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(50),
                                                                             heightDimension: .fractionalHeight(1.0)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                          heightDimension: .absolute(40)),
                                                       subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: leadingPadding, bottom: 0, trailing: trailingPadding)
        group.interItemSpacing = .fixed(10)
        
        return group
    }
    
    func visit(_ viewObject: DateViewObject) -> NSCollectionLayoutGroup? {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                             heightDimension: .fractionalHeight(1.0)))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                        heightDimension: .absolute(50)),
                                                     subitems: [item])
        
        return group
    }
}

struct ChatRoomMessageCellVisitor: ChatRoomMessageVisitor {
    
    func visit(_ viewObject: CreateInfoViewObject) -> UICollectionViewCell.Type? {
        return ChatRoomCreateInfoCollectionViewCell.self
    }
    
    func visit(_ viewObject: CommentInfoViewObject) -> UICollectionViewCell.Type? {
        return CharRoomCommentInfoCollectionViewCell.self
    }
    
    func visit(_ viewObject: ContentViewObject) -> UICollectionViewCell.Type? {
        return ChatRoomContentCollectionViewCell.self
    }
    
    func visit(_ viewObject: LinkViewObject) -> UICollectionViewCell.Type? {
        return ChatRoomLinkCollectionViewCell.self
    }
    
    func visit(_ viewObject: PhotoViewObject) -> UICollectionViewCell.Type? {
        return ChatRoomPhotoCollectionViewCell.self
    }
    
    func visit(_ viewObject: EmojiViewObject) -> UICollectionViewCell.Type? {
        return ChatRoomEmojiCollectionViewCell.self
    }
    
    func visit(_ viewObject: DateViewObject) -> UICollectionViewCell.Type? {
        return ChatRoomDateCollectionViewCell.self
    }
}

struct ChatRoomMessageCellConfiguratorVisitor: ChatRoomMessageVisitor {
    
    private let dateUtility = DateUtility()
    
    let cell: UICollectionViewCell
    
    func visit(_ viewObject: CreateInfoViewObject) -> UICollectionViewCell? {
        
        guard let cell = cell as? ChatRoomCreateInfoCollectionViewCell else { return nil }
        
        cell.creatorImageView.sd_setImage(with: URL(string: viewObject.creator.imageURL))
        cell.creatorNameLabel.text = viewObject.creator.name
        cell.dateLabel.text = dateUtility.getString(from: Date(timeIntervalSince1970: viewObject.createTime), format: "a HH:mm")
        
        return cell
    }
    
    func visit(_ viewObject: CommentInfoViewObject) -> UICollectionViewCell? {
        
        guard let cell = cell as? CharRoomCommentInfoCollectionViewCell else { return nil }
        
        cell.creatorNameLabel.text = "Comment・\(viewObject.creator.name)"
        cell.contentLabel.text = viewObject.text
        
        return cell
    }
    
    func visit(_ viewObject: ContentViewObject) -> UICollectionViewCell? {
        
        guard let cell = cell as? ChatRoomContentCollectionViewCell else { return nil }
        
        cell.contentLabel.text = viewObject.text
        
        return cell
    }
    
    func visit(_ viewObject: LinkViewObject) -> UICollectionViewCell? {
        
        guard let cell = cell as? ChatRoomLinkCollectionViewCell else { return nil }
        
        if let data = LPLinkMetadataCache.shared.get(url: viewObject.urlString) {
            cell.updateLink(metadata: data)
        } else {
            cell.fetchingMetadata(link: viewObject.urlString) { data in
                LPLinkMetadataCache.shared.cache(url: viewObject.urlString, data: data)
            }
        }
        
        return cell
    }
    
    func visit(_ viewObject: PhotoViewObject) -> UICollectionViewCell? {
        
        guard let cell = cell as? ChatRoomPhotoCollectionViewCell else { return nil }
        
        cell.photoImageView.sd_setImage(with: URL(string: viewObject.urlString))
        
        return cell
    }
    
    func visit(_ viewObject: EmojiViewObject) -> UICollectionViewCell? {
        
        guard let cell = cell as? ChatRoomEmojiCollectionViewCell else { return nil }
        
        cell.emojiImageView.image = viewObject.type.iconImage
        cell.countLabel.text = "\(viewObject.count)"
        
        return cell
    }
    
    func visit(_ viewObject: DateViewObject) -> UICollectionViewCell? {
        
        guard let cell = cell as? ChatRoomDateCollectionViewCell else { return nil }
        
        cell.dateLabel.text = viewObject.dateString
        
        return cell
    }
}
