//
//  String+Extension .swift
//  KOLfanci
//
//  Created by cm0678 on 2022/10/20.
//

import UIKit

extension String {
    
    var isBlank: Bool {
        let trimmedStr = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedStr.isEmpty
    }
    
    func detectURLsIn() -> [String] {
        
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else { return [] }
        
        let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))

        return matches.compactMap { result in
            guard let range = Range(result.range, in: self) else { return nil }
            let url = self[range]
            return String(url)
        }
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width,
                                    height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font],
                                            context: nil)
        return ceil(boundingBox.height)
    }
}
