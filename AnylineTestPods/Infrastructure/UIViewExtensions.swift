//
//  UIViewExtensions.swift
//  AnylineTestPods
//
//  Created by Dan Ilies on 21/05/2019.
//  Copyright © 2019 Wolfpack-Digital. All rights reserved.
//

import UIKit

/*
 * MARK: - Rounded Corners
 */
extension UIView {
    
    // Corner Radius
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

/*
 * MARK: - Border
 */
extension UIView {
    // Border Width
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    // Border Color
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

/*
 * MARK: - Shadow
 */

extension UIView {
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let cgColor = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var masksToBound:  Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
}


extension UIView {
    
    func addSubviewAligned(_ subview: UIView, padding: UIEdgeInsets = .zero) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = true
        subview.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        subview.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
    }
    
}
