//
//  Constrainable.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/1/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

// MARK: - Constrainable

protocol LayoutConstrainable {
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
    
    func prepareForLayout()
}

extension LayoutConstrainable {
    func layout(_ block: (Self) -> Void) {
        block(self)
    }
}

extension UIView: LayoutConstrainable {
    func prepareForLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILayoutGuide: LayoutConstrainable {
    func prepareForLayout() { }
}

// MARK: - Partial Constraint Creation

extension LayoutConstrainable {
    
    // MARK: Anchor Constraints
    
    func pin(_ anchor: LayoutXAxisAnchor)
    -> PartialLayoutConstraint<Self, LayoutXAxisAnchor> {
        return _pin(anchor)
    }
    
    func pin(_ anchor: LayoutYAxisAnchor)
    -> PartialLayoutConstraint<Self, LayoutYAxisAnchor> {
        return _pin(anchor)
    }
    
    func pin(_ anchor: LayoutDimensionAnchor)
    -> PartialLayoutConstraint<Self, LayoutDimensionAnchor> {
        return _pin(anchor)
    }
    
    func pin(_ anchor: LayoutCompositeEdgeAnchor)
    -> PartialLayoutCompositeConstraint<Self, LayoutCompositeEdgeAnchor> {
        return _pin(anchor)
    }
    
    func pin(_ anchor: LayoutCompositeCenterAnchor)
    -> PartialLayoutCompositeConstraint<Self, LayoutCompositeCenterAnchor> {
        return _pin(anchor)
    }
    
    func pin(_ anchor: LayoutCompositeSizeAnchor)
    -> PartialLayoutCompositeConstraint<Self, LayoutCompositeSizeAnchor> {
        return _pin(anchor)
    }
    
    // MARK: Private Methods
    
    private func _pin<AnchorType: LayoutAnchor>(_ anchor: AnchorType)
    -> PartialLayoutConstraint<Self, AnchorType> {
        
        prepareForLayout()
        return PartialLayoutConstraint(item: self, anchor: anchor)
    }
    
    func _pin<AnchorType: LayoutCompositeAnchor>(_ anchor: AnchorType)
    -> PartialLayoutCompositeConstraint<Self, AnchorType> {
        
        prepareForLayout()
        return PartialLayoutCompositeConstraint(item: self, anchor: anchor)
    }
    
}
