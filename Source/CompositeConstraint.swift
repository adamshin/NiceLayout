//
//  CompositeConstraint.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/1/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

// MARK: - Layout Composite Constraint

public protocol LayoutCompositeConstraint {
    var rawConstraints: [RawConstraint] { get }
}

extension LayoutCompositeConstraint {
    
    public var constraints: [NSLayoutConstraint] {
        return rawConstraints.map { $0.systemConstraint }
    }
    
    @discardableResult
    public func priority(_ priority: UILayoutPriority) -> Self {
        rawConstraints.forEach { $0.setPriority(priority) }
        return self
    }
    
    @discardableResult
    public func priority(_ rawValue: Float) -> Self {
        return priority(UILayoutPriority(rawValue: rawValue))
    }
    
}

// MARK: - Item to Size Composite Constraint

public struct ItemToSizeLayoutCompositeConstraint:
LayoutCompositeConstraint {
    
    public let rawConstraints: [RawConstraint]
    
    internal init(item: LayoutConstrainable,
        width: CGFloat, height: CGFloat) {
        
        rawConstraints = [
            RawConstraint(item: item, attribute: .width, constant: width),
            RawConstraint(item: item, attribute: .height, constant: height),
        ]
    }
    
}

// MARK: - Item to Item Composite Constraint

public struct ItemToItemLayoutCompositeConstraint
    <AnchorType: LayoutCompositeAnchor>:
LayoutCompositeConstraint {
    
    public let rawConstraints: [RawConstraint]
    
    internal init(item1: LayoutConstrainable, item2: LayoutConstrainable,
        sharedAnchor: AnchorType) {
        
        rawConstraints = sharedAnchor.attributes.map {
            RawConstraint(
                item1: item1, attribute1: $0,
                item2: item2, attribute2: $0)
        }
    }
    
}

extension ItemToItemLayoutCompositeConstraint
where AnchorType == LayoutCompositeEdgeAnchor {
    
    @discardableResult
    public func inset(_ inset: CGFloat) -> Self {
        rawConstraints.forEach { $0.setInset(inset) }
        return self
    }
    
}

extension ItemToItemLayoutCompositeConstraint
where AnchorType == LayoutCompositeCenterAnchor {
    
    @discardableResult
    public func offset(x: CGFloat, y: CGFloat) -> Self {
        rawConstraints
            .first { $0.systemConstraint.firstAttribute == .centerX }?
            .setConstant(x)
        rawConstraints
            .first { $0.systemConstraint.firstAttribute == .centerY }?
            .setConstant(y)
        return self
    }
    
}

extension ItemToItemLayoutCompositeConstraint
where AnchorType == LayoutCompositeSizeAnchor {
    
    @discardableResult
    public func multiplier(_ multiplier: CGFloat) -> Self {
        rawConstraints.forEach { $0.setMultiplier(multiplier) }
        return self
    }
    
}
