//
//  Constraint.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/1/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

// MARK: - Layout Constraint

public protocol LayoutConstraint {
    var rawConstraint: RawConstraint { get }
}

extension LayoutConstraint {
    
    public var constraint: NSLayoutConstraint {
        return rawConstraint.systemConstraint
    }
    
    @discardableResult
    public func relation(_ relation: NSLayoutConstraint.Relation) -> Self {
        rawConstraint.setRelation(relation)
        return self
    }
    
    @discardableResult
    public func relation(_ op: LayoutRelationOperator)
    -> Self {
        let value = op(LayoutRelationProxy(), LayoutRelationProxy())
        return relation(value)
    }
    
    @discardableResult
    public func priority(_ priority: UILayoutPriority) -> Self {
        rawConstraint.setPriority(priority)
        return self
    }
    
    @discardableResult
    public func priority(_ rawValue: Float) -> Self {
        return priority(UILayoutPriority(rawValue: rawValue))
    }
    
}

// MARK: - Item to Constant Constraint

public struct ItemToConstantLayoutConstraint:
LayoutConstraint {
    
    public let rawConstraint: RawConstraint
    
    internal init(item: LayoutConstrainable, anchor: LayoutAnchor,
        constant: CGFloat) {
        
        rawConstraint = RawConstraint(
            item: item, attribute: anchor.attribute,
            constant: constant)
    }
    
}

// MARK: - Item to Item Constraint

public struct ItemToItemLayoutConstraint<AnchorType: LayoutAnchor>:
LayoutConstraint {
    
    public let rawConstraint: RawConstraint
    
    internal init(item1: LayoutConstrainable, anchor1: AnchorType,
        item2: LayoutConstrainable, anchor2: AnchorType) {
        
        rawConstraint = RawConstraint(
            item1: item1, attribute1: anchor1.attribute,
            item2: item2, attribute2: anchor2.attribute)
    }
    
}

extension ItemToItemLayoutConstraint
where AnchorType: LayoutEdgeAnchor {
    
    @discardableResult
    public func offset(_ offset: CGFloat) -> Self {
        rawConstraint.setConstant(offset)
        return self
    }
    
    @discardableResult
    public func inset(_ inset: CGFloat) -> Self {
        rawConstraint.setInset(inset)
        return self
    }
    
}

extension ItemToItemLayoutConstraint
where AnchorType == LayoutSizeAnchor {
    
    @discardableResult
    public func constant(_ constant: CGFloat) -> Self {
        rawConstraint.setConstant(constant)
        return self
    }
    
    @discardableResult
    public func multiplier(_ multiplier: CGFloat) -> Self {
        rawConstraint.setMultiplier(multiplier)
        return self
    }
    
}
