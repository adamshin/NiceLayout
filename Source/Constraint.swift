//
//  Constraint.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/1/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

// MARK: Layout Constraint

protocol LayoutConstraint {
    var rawConstraint: RawConstraint { get }
}

extension LayoutConstraint {
    
    var constraint: NSLayoutConstraint {
        rawConstraint.systemConstraint
    }
    
    @discardableResult
    func relation(_ relation: LayoutRelation) -> Self {
        rawConstraint.setRelation(relation)
        return self
    }
    
    @discardableResult
    func priority(_ priority: UILayoutPriority) -> Self {
        rawConstraint.setPriority(priority)
        return self
    }
    
    @discardableResult
    func priority(_ rawValue: Float) -> Self {
        return priority(UILayoutPriority(rawValue: rawValue))
    }
    
}

// MARK: Item to Constant Layout Constraint

struct ItemToConstantLayoutConstraint:
LayoutConstraint {
    
    let rawConstraint: RawConstraint
    
    init(item: LayoutConstrainable, anchor: LayoutAnchor,
        constant: CGFloat) {
        
        rawConstraint = RawConstraint(
            item: item, attribute: anchor.attribute,
            constant: constant)
    }
    
}

// MARK: Item to Item Layout Constraint

struct ItemToItemLayoutConstraint<AnchorType: LayoutAnchor>:
LayoutConstraint {
    
    let rawConstraint: RawConstraint
    
    init(item1: LayoutConstrainable, anchor1: AnchorType,
        item2: LayoutConstrainable, anchor2: AnchorType) {
        
        rawConstraint = RawConstraint(
            item1: item1, attribute1: anchor1.attribute,
            item2: item2, attribute2: anchor2.attribute)
    }
    
}

extension ItemToItemLayoutConstraint {
    
    @discardableResult
    func offset(_ offset: CGFloat) -> Self {
        rawConstraint.setConstant(offset)
        return self
    }
    
}

extension ItemToItemLayoutConstraint
where AnchorType: LayoutEdgeAnchor {
    
    @discardableResult
    func inset(_ inset: CGFloat) -> Self {
        rawConstraint.setInset(inset)
        return self
    }
    
}

extension ItemToItemLayoutConstraint
where AnchorType == LayoutDimensionAnchor {
    
    @discardableResult
    func multiplier(_ multiplier: CGFloat) -> Self {
        rawConstraint.setMultiplier(multiplier)
        return self
    }
    
}
