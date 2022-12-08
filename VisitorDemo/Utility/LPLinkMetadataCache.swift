//
//  LPLinkMetadataCache.swift
//  KOLfanci
//
//  Created by cm0678 on 2022/11/4.
//

import Foundation
import LinkPresentation

class LPLinkMetadataCache {
    
    static let shared = LPLinkMetadataCache()
    
    private init() {}
    
    let cache = NSCache<NSString, LPLinkMetadata>()
    
    func get(url: String) -> LPLinkMetadata? {
        cache.object(forKey: NSString(string: url))
    }
    
    func cache(url: String, data: LPLinkMetadata) {
        cache.setObject(data, forKey: NSString(string: url))
    }
}
