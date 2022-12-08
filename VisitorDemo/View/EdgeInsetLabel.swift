//
//  EdgeInsetLabel.swift
//  KOLfanci
//
//  Created by cm0678 on 2022/11/1.
//

import UIKit

class EdgeInsetLabel: UILabel {
    
    var textInsets: UIEdgeInsets = UIEdgeInsets.zero
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var rect = super.textRect(forBounds: bounds.inset(by: textInsets), limitedToNumberOfLines: numberOfLines)
        rect.origin.x -= textInsets.left
        rect.origin.y -= textInsets.top
        rect.size.width += textInsets.left + textInsets.right
        rect.size.height += textInsets.top + textInsets.bottom
        return rect
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}

