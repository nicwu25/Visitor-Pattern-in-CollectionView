//
//  UIViewController+Extension.swift
//  VisitorDemo
//
//  Created by cm0678 on 2022/12/6.
//

import UIKit

extension UIView {
    
    func activate(_ constraints: [NSLayoutConstraint]) {
        NSLayoutConstraint.activate(constraints)
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding.bottom),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding.left),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding.right)
        ])
    }
    
    func fillSafeAreaSuperview(padding: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: padding.top),
            self.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -padding.bottom),
            self.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: padding.left),
            self.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -padding.right)
        ])
    }
    
    var bottomPadding: CGFloat {
        let window = UIApplication.shared.windows.first
        return window?.safeAreaInsets.bottom ?? 0
    }
}
