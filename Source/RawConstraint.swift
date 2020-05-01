//
//  RawConstraint.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/2/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

// MARK: - Raw Constraint

public class RawConstraint {
    
    var systemConstraint: NSLayoutConstraint
    
    // MARK: Initializers
    
    internal init(
        item: LayoutConstrainable,
        attribute: NSLayoutConstraint.Attribute,
        constant: CGFloat) {
        
        systemConstraint = NSLayoutConstraint(
            item: item,
            attribute: attribute,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: constant)
        
        systemConstraint.isActive = true
    }
    
    internal init(
        item1: LayoutConstrainable,
        attribute1: NSLayoutConstraint.Attribute,
        item2: LayoutConstrainable,
        attribute2: NSLayoutConstraint.Attribute) {
        
        systemConstraint = NSLayoutConstraint(
            item: item1,
            attribute: attribute1,
            relatedBy: .equal,
            toItem: item2,
            attribute: attribute2,
            multiplier: 1,
            constant: 0)
        
        systemConstraint.isActive = true
    }
    
    // MARK: Constraint Modification
    
    internal func setRelation(_ relation: LayoutRelation) {
        let systemRelation: NSLayoutConstraint.Relation = {
            switch relation {
            case .equal: return .equal
            case .lessOrEqual: return .lessThanOrEqual
            case .greaterOrEqual: return .greaterThanOrEqual
            }
        }()
        
        let c = NSLayoutConstraint.create(
            from: systemConstraint,
            relation: systemRelation)
        
        replaceSystemConstraint(c)
    }
    
    internal func setMultiplier(_ multiplier: CGFloat) {
        let c = NSLayoutConstraint.create(
            from: systemConstraint,
            multiplier: multiplier)
        
        replaceSystemConstraint(c)
    }
    
    internal func setPriority(_ priority: UILayoutPriority) {
        systemConstraint.priority = priority
    }
    
    internal func setConstant(_ constant: CGFloat) {
        systemConstraint.constant = constant
    }
    
    internal func setInset(_ inset: CGFloat) {
        let coefficient: CGFloat = {
            switch systemConstraint.firstAttribute {
            case .leading, .left, .top: return 1
            case .trailing, .right, .bottom: return -1
            default: return 0
            }
        }()
        systemConstraint.constant = inset * coefficient
    }
    
    // MARK: Private Methods
    
    private func replaceSystemConstraint(
        _ newSystemConstraint: NSLayoutConstraint) {
        
        systemConstraint.isActive = false
        newSystemConstraint.isActive = true
        
        self.systemConstraint = newSystemConstraint
    }
    
}

// MARK: - NSLayoutConstraint Extension

private extension NSLayoutConstraint {
    
    static func create(from c: NSLayoutConstraint,
        relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(
            item: c.firstItem!,
            attribute: c.firstAttribute,
            relatedBy: relation,
            toItem: c.secondItem,
            attribute: c.secondAttribute,
            multiplier: c.multiplier,
            constant: c.constant)
        
        constraint.priority = c.priority
        return constraint
    }
    
    static func create(from c: NSLayoutConstraint,
        multiplier: CGFloat) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(
            item: c.firstItem!,
            attribute: c.firstAttribute,
            relatedBy: c.relation,
            toItem: c.secondItem,
            attribute: c.secondAttribute,
            multiplier: multiplier,
            constant: c.constant)
        
        constraint.priority = c.priority
        return constraint
    }
    
}
