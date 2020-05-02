//
//  Constrainable.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/1/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

// MARK: - Constrainable

public protocol LayoutConstrainable {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    
    func prepareForAutoLayout()
}

extension UIView: LayoutConstrainable {
    public func prepareForAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILayoutGuide: LayoutConstrainable {
    public func prepareForAutoLayout() { }
}

// MARK: - Partial Constraint Creation

extension LayoutConstrainable {
    
    public func pin(_ anchor: LayoutXAxisAnchor)
    -> PartialLayoutConstraint<Self, LayoutXAxisAnchor> {
        return pinAnchor(anchor)
    }
    
    public func pin(_ anchor: LayoutYAxisAnchor)
    -> PartialLayoutConstraint<Self, LayoutYAxisAnchor> {
        return pinAnchor(anchor)
    }
    
    public func pin(_ anchor: LayoutSizeAnchor)
    -> PartialLayoutConstraint<Self, LayoutSizeAnchor> {
        return pinAnchor(anchor)
    }
    
    public func pin(_ anchor: LayoutCompositeEdgeAnchor)
    -> PartialLayoutCompositeConstraint<Self, LayoutCompositeEdgeAnchor> {
        return pinCompositeAnchor(anchor)
    }
    
    public func pin(_ anchor: LayoutCompositeCenterAnchor)
    -> PartialLayoutCompositeConstraint<Self, LayoutCompositeCenterAnchor> {
        return pinCompositeAnchor(anchor)
    }
    
    public func pin(_ anchor: LayoutCompositeSizeAnchor)
    -> PartialLayoutCompositeConstraint<Self, LayoutCompositeSizeAnchor> {
        return pinCompositeAnchor(anchor)
    }
    
    // MARK: Internal Methods
    
    private func pinAnchor<AnchorType: LayoutAnchor>
        (_ anchor: AnchorType)
    -> PartialLayoutConstraint<Self, AnchorType> {
        
        prepareForAutoLayout()
        return PartialLayoutConstraint(item: self, anchor: anchor)
    }
    
    private func pinCompositeAnchor<AnchorType: LayoutCompositeAnchor>
        (_ anchor: AnchorType)
    -> PartialLayoutCompositeConstraint<Self, AnchorType> {
        
        prepareForAutoLayout()
        return PartialLayoutCompositeConstraint(item: self, anchor: anchor)
    }
    
}

// MARK: - Convenience Block Layout

extension LayoutConstrainable {
    
    public func layout(_ block: (Self) -> Void) {
        block(self)
    }
    
}
