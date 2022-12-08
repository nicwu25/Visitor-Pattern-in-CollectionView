//
//  ChatRoomMessageViewObject+Sample.swift
//  VisitorDemo
//
//  Created by cm0678 on 2022/12/7.
//

import Foundation

extension ChatRoomMessageViewObject {
    
    static let hakase: CreatorViewObject = CreatorViewObject(id: "1",
                                                             name: "hakase",
                                                             imageURL: "https://i.pinimg.com/564x/71/38/46/713846c2179bd9d07bd74609834ad1d2.jpg")
    
    static let conan: CreatorViewObject = CreatorViewObject(id: "2",
                                                            name: "conan",
                                                            imageURL: "https://i.pinimg.com/236x/69/9c/c4/699cc4c5317e0e4e2d97c1cde36ce5f5.jpg")
    
    static let ran: CreatorViewObject = CreatorViewObject(id: "3",
                                                          name: "ran",
                                                          imageURL: "https://i.pinimg.com/564x/1d/5e/2b/1d5e2be3351cd96a9e4abe67766220d5.jpg")
    
    static let sample: [ChatRoomMessageViewObject] = [
        ChatRoomMessageViewObject(id: "1", createInfo: CreateInfoViewObject(creator: hakase,
                                                                            createTime: 1667756510),
                                  commentInfo: nil,
                                  content: ContentViewObject(text: "哇啦"),
                                  links: [],
                                  photos: [],
                                  emojis: []),
        ChatRoomMessageViewObject(id: "2", createInfo: CreateInfoViewObject(creator: conan,
                                                                            createTime: 1667756510),
                                  commentInfo: CommentInfoViewObject(creator: hakase,
                                                                     messageID: "1",
                                                                     text: "哇啦"),
                                  content: ContentViewObject(text: "哇啦哇啦哇啦"),
                                  links: [],
                                  photos: [],
                                  emojis: [EmojiViewObject(type: .angry, count: 5)]),
        ChatRoomMessageViewObject(id: "3", createInfo: CreateInfoViewObject(creator: ran,
                                                                            createTime: 1668015710),
                                  commentInfo: nil,
                                  content: ContentViewObject(text: "哇啦哇啦哇啦"),
                                  links: [LinkViewObject(urlString: "https://www.youtube.com/watch?v=I3EWFNG4ESA"),
                                          LinkViewObject(urlString: "https://tw.stock.yahoo.com/news/%E7%81%B0%E5%8E%9F%E4%B8%8D%E8%A6%81%E6%AD%BB-%E6%9F%AF%E5%8D%972023%E5%8A%87%E5%A0%B4%E7%89%88-%E9%BB%91%E9%90%B5%E7%9A%84%E9%AD%9A%E5%BD%B1-%E9%82%84%E6%9C%892%E4%BA%BA%E6%B0%A3%E8%A7%92%E8%89%B2%E7%B2%89%E7%B5%B2%E5%97%A8%E7%BF%BB-102512197.html")],
                                  photos: [],
                                  emojis: []),
        ChatRoomMessageViewObject(id: "4", createInfo: CreateInfoViewObject(creator: ran,
                                                                            createTime: 1668073310),
                                  commentInfo: nil,
                                  content: ContentViewObject(text: "哇啦哇啦哇哇哇哇"),
                                  links: [],
                                  photos: [PhotoViewObject(urlString: "https://i.pinimg.com/564x/0c/54/ac/0c54ac84de341dab1465b2dbeebf42c7.jpg"),
                                           PhotoViewObject(urlString: "https://i.pinimg.com/236x/85/ee/8d/85ee8da14bf4a13d11ce513a9412f062.jpg")],
                                  emojis: [EmojiViewObject(type: .like, count: 56),
                                           EmojiViewObject(type: .think, count: 1)]),
        ChatRoomMessageViewObject(id: "5", createInfo: CreateInfoViewObject(creator: conan,
                                                                            createTime: 1669891310),
                                  commentInfo: CommentInfoViewObject(creator: ran,
                                                                     messageID: "4",
                                                                     text: "哇啦哇啦哇哇哇哇"),
                                  content: ContentViewObject(text: "哈哈哈"),
                                  links: [],
                                  photos: [],
                                  emojis: []),
        ChatRoomMessageViewObject(id: "6", createInfo: CreateInfoViewObject(creator: hakase,
                                                                            createTime: 1669903370),
                                  commentInfo: nil,
                                  content: ContentViewObject(text: "哇啦哇啦哇啦哇啦 哇啦哇啦哇啦哇啦 哇啦哇啦哇啦哇啦 哇啦哇啦哇啦哇啦 哇啦哇啦哇啦哇啦"),
                                  links: [LinkViewObject(urlString: "https://today.line.me/tw/v2/article/zNVqywg")],
                                  photos: [PhotoViewObject(urlString: "https://obs.line-scdn.net/0hKJFZSG_jFGV7IwPsY01rMkN1GBRIRQ5sWUxYA1olSAUCD1IwRUBHBl8nHUkGEQAzWxYLVlohT1JURlsxRg/w1200")],
                                  emojis: [EmojiViewObject(type: .money, count: 5),
                                           EmojiViewObject(type: .shock, count: 2)]),
        ChatRoomMessageViewObject(id: "7", createInfo: CreateInfoViewObject(creator: conan,
                                                                            createTime: 1670353953),
                                  commentInfo: CommentInfoViewObject(creator: ran,
                                                                     messageID: "4",
                                                                     text: "哇啦哇啦哇哇哇哇"),
                                  content: ContentViewObject(text: "哇啦"),
                                  links: [LinkViewObject(urlString: "https://www.youtube.com/watch?v=I3EWFNG4ESA")],
                                  photos: [PhotoViewObject(urlString: "https://i.pinimg.com/564x/0c/54/ac/0c54ac84de341dab1465b2dbeebf42c7.jpg")],
                                  emojis: [EmojiViewObject(type: .like, count: 5),
                                           EmojiViewObject(type: .laugh, count: 2)])
    ]
}
