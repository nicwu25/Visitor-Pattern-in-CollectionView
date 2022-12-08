//
//  MessageViewModel.swift
//  KOLfanci
//
//  Created by cm0678 on 2022/10/24.
//

import Foundation
import UIKit

struct ChatRoomMessageViewObject {
    var id: String
    let createInfo: CreateInfoViewObject
    let commentInfo: CommentInfoViewObject?
    let content: ContentViewObject?
    let links: [LinkViewObject]
    var photos: [PhotoViewObject]
    var emojis: [EmojiViewObject]
}

struct CreatorViewObject {
    let id: String
    let name: String
    let imageURL: String
}

struct CreateInfoViewObject: ChatRoomMessageVisitable {
    let creator: CreatorViewObject
    let createTime: TimeInterval
    
    func accept<V>(visitor: V) -> V.T? where V: ChatRoomMessageVisitor {
        return visitor.visit(self)
    }
}

struct CommentInfoViewObject: ChatRoomMessageVisitable {
    let creator: CreatorViewObject
    let messageID: String
    let text: String?
    
    func accept<V>(visitor: V) -> V.T? where V: ChatRoomMessageVisitor {
        return visitor.visit(self)
    }
}

struct ContentViewObject: ChatRoomMessageVisitable {
    let text: String
    
    func accept<V>(visitor: V) -> V.T? where V: ChatRoomMessageVisitor {
        return visitor.visit(self)
    }
}

struct LinkViewObject: ChatRoomMessageVisitable {
    let urlString: String
    
    func accept<V>(visitor: V) -> V.T? where V: ChatRoomMessageVisitor {
        return visitor.visit(self)
    }
}

struct PhotoViewObject: ChatRoomMessageVisitable {
    var urlString: String
    
    func accept<V>(visitor: V) -> V.T? where V: ChatRoomMessageVisitor {
        return visitor.visit(self)
    }
}

enum EmojiTypeViewObject: String {
    
    case like
    case laugh
    case shock
    case cry
    case think
    case angry
    case money
    
    var iconImage: UIImage? {
        switch self {
        case .like:
            return UIImage(named: "emoji_like")
        case .money:
            return UIImage(named: "emoji_money")
        case .laugh:
            return UIImage(named: "emoji_laugh")
        case .shock:
            return UIImage(named: "emoji_shock")
        case .think:
            return UIImage(named: "emoji_think")
        case .cry:
            return UIImage(named: "emoji_cry")
        case .angry:
            return UIImage(named: "emoji_angry")
        }
    }
}

struct EmojiViewObject: ChatRoomMessageVisitable {
    let type: EmojiTypeViewObject
    var count: Int
    
    func accept<V>(visitor: V) -> V.T? where V: ChatRoomMessageVisitor {
        return visitor.visit(self)
    }
}

struct DateViewObject: ChatRoomMessageVisitable {
    let dateString: String
    
    func accept<V>(visitor: V) -> V.T? where V: ChatRoomMessageVisitor {
        return visitor.visit(self)
    }
}
