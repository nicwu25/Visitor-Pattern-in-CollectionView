//
//  ChatRoomViewModel.swift
//  VisitorDemo
//
//  Created by cm0678 on 2022/12/6.
//

import UIKit

class ChatRoomMessageViewModel {
    
    enum SectionLayoutKind {
        case date(String), message(ChatRoomMessageViewObject)
    }
    
    var sections: [SectionLayoutKind] {
        getSections()
    }
    
    var messages: [ChatRoomMessageViewObject] = ChatRoomMessageViewObject.sample
    
    private func getSections() -> [SectionLayoutKind] {
        
        var sections: [SectionLayoutKind] = []
        
        let dateUtility = DateUtility()
        
        Dictionary(grouping: messages) { dateUtility.getString(from: Date(timeIntervalSince1970: $0.createInfo.createTime), format: "yyyy/MM/dd (E)") }
        .sorted(by: { $0.key < $1.key })
        .forEach { (key: String, value: [ChatRoomMessageViewObject]) in
            sections.append(.date(key))
            sections.append(contentsOf: value.map{ .message($0) })
        }
        
        return sections
    }
    
    private func getSectionLayoutKind(atSection index: Int) -> SectionLayoutKind? {
        
        if sections.indices.contains(index) {
            return sections[index]
        }
        
        return nil
    }
    
    func getNumberOfSections() -> Int {
        sections.count
    }
    
    func getNumberOfRowsInSection(_ section: Int) -> Int {
        getRows(atSection: section).count
    }
    
    func getVisitable(indexPath: IndexPath) -> ChatRoomMessageVisitable? {
        
        let rows = getRows(atSection: indexPath.section)
        
        if rows.indices.contains(indexPath.row) {
            return rows[indexPath.row]
        }
        
        return nil
    }
    
    func getRows(atSection section: Int) -> [ChatRoomMessageVisitable] {
        
        guard let sectionKind = getSectionLayoutKind(atSection: section) else { return [] }
        
        switch sectionKind {
        case .date(let date):
            return [DateViewObject(dateString: date)]
        case .message(let message):
            return getMessageRows(message)
        }
    }
    
    private func getMessageRows(_ message: ChatRoomMessageViewObject) -> [ChatRoomMessageVisitable] {
        
        var rows: [ChatRoomMessageVisitable] = []
        
        rows.append(message.createInfo)
        
        if let comment = message.commentInfo {
            rows.append(comment)
        }

        if let content = message.content {
            rows.append(content)
        }

        rows.append(contentsOf: message.links.map{$0})

        rows.append(contentsOf: message.photos.map{$0})
        
        rows.append(contentsOf: message.emojis.map{$0})
       
        return rows
    }
}
