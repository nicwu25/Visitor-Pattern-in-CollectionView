//
//  UIView+Extension.swift
//  VisitorDemo
//
//  Created by cm0678 on 2022/12/6.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alpha: Double = 1.0) {
        self.init(red: CGFloat(red)/255,
                  green: CGFloat(green)/255,
                  blue: CGFloat(blue)/255,
                  alpha: alpha)
    }
}

extension UIColor {
    
    static var main: UIColor {
        UIColor(red: 79, green: 112, blue: 229)
    }
    
    static var base: UIColor {
        .white.withAlphaComponent(0.05)
    }
    
    static var bg40: UIColor {
        UIColor(red: 61, green: 68, blue: 82)
    }
    
    static var bg60: UIColor {
        UIColor(red: 48, green: 55, blue: 68)
    }
    
    static var bg80: UIColor {
        UIColor(red: 43, green: 49, blue: 60)
    }
    
    static var bg100: UIColor {
        UIColor(red: 32, green: 38, blue: 47)
    }
}

// MARK: - 元件色
extension UIColor {
    
    static var tabUnselected: UIColor {
        UIColor(red: 0, green: 0, blue: 0).withAlphaComponent(0.2)
    }
    
    static var tabSelected: UIColor {
        .white
    }
    
    static var object: UIColor {
        .white.withAlphaComponent(0.5)
    }
}

// MARK: - 文字色
extension UIColor {
    
    static var text30: UIColor {
        .white.withAlphaComponent(0.3)
    }
    
    static var text50: UIColor {
        .white.withAlphaComponent(0.5)
    }
    
    static var text80: UIColor {
        .white.withAlphaComponent(0.8)
    }
    
    static var text100: UIColor {
        .white
    }
    
    static var textOther: UIColor {
        .white
    }
}

// MARK: - 輸入匡
extension UIColor {
    
    static var textField30: UIColor {
        UIColor(red: 45, green: 45, blue: 45).withAlphaComponent(0.3)
    }
    
    static var textField50: UIColor {
        UIColor(red: 45, green: 45, blue: 45).withAlphaComponent(0.5)
    }
    
    static var textField80: UIColor {
        UIColor(red: 45, green: 45, blue: 45).withAlphaComponent(0.8)
    }
    
    static var textField100: UIColor {
        UIColor(red: 45, green: 45, blue: 45)
    }
    
    static var textField: UIColor {
        .white.withAlphaComponent(0.9)
    }
}
