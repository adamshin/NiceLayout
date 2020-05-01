//
//  PartialConstraint.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/2/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

// MARK: - Partial Constraint

class PartialLayoutConstraint
<ItemType: LayoutConstrainable, AnchorType: LayoutAnchor> {
    
    let item: ItemType
    let anchor: AnchorType
    
    init(item: ItemType, anchor: AnchorType) {
        self.item = item
        self.anchor = anchor
    }
    
    @discardableResult
    func to(_ c: LayoutConstrainable, _ a: AnchorType)
    -> ItemToItemLayoutConstraint<AnchorType> {
        
        return ItemToItemLayoutConstraint(
            item1: item, anchor1: anchor,
            item2: c, anchor2: a)
    }
    
    @discardableResult
    func to(_ c: LayoutConstrainable)
    -> ItemToItemLayoutConstraint<AnchorType> {
        
        return to(c, anchor)
    }
    
}

extension PartialLayoutConstraint
where ItemType: UIView {
    
    @discardableResult
    func to(_ target: LayoutSuperviewTarget, _ a: AnchorType)
    -> ItemToItemLayoutConstraint<AnchorType> {
        
        let c = constrainable(for: item, target: target)
        return to(c, a)
    }
    
    @discardableResult
    func to(_ target: LayoutSuperviewTarget)
    -> ItemToItemLayoutConstraint<AnchorType> {
        
        return to(target, anchor)
    }
    
}

extension PartialLayoutConstraint
where AnchorType == LayoutDimensionAnchor {
    
    @discardableResult
    func to(_ constant: CGFloat)
    -> ItemToConstantLayoutConstraint {
        
        return ItemToConstantLayoutConstraint(
            item: item, anchor: anchor,
            constant: constant)
    }
    
}

// MARK: - Partial Composite Constraint

class PartialLayoutCompositeConstraint
<ItemType: LayoutConstrainable, AnchorType: LayoutCompositeAnchor> {

    let item: ItemType
    let anchor: AnchorType
    
    init(item: ItemType, anchor: AnchorType) {
        self.item = item
        self.anchor = anchor
    }
    
    @discardableResult
    func to(_ c: LayoutConstrainable)
    -> ItemToItemLayoutCompositeConstraint<AnchorType> {
        
        return ItemToItemLayoutCompositeConstraint(
            item1: item, item2: c,
            sharedAnchor: anchor)
    }

}

extension PartialLayoutCompositeConstraint
where ItemType: UIView {
    
    @discardableResult
    func to(_ target: LayoutSuperviewTarget)
    -> ItemToItemLayoutCompositeConstraint<AnchorType> {
        
        let c = constrainable(for: item, target: target)
        return to(c)
    }
    
}

extension PartialLayoutCompositeConstraint
where AnchorType == LayoutCompositeSizeAnchor {
    
    @discardableResult
    func to(width: CGFloat, height: CGFloat)
    -> ItemToSizeLayoutCompositeConstraint {
        
        return ItemToSizeLayoutCompositeConstraint(
            item: item,
            width: width, height: height)
    }
    
    @discardableResult
    func to(_ size: CGSize)
    -> ItemToSizeLayoutCompositeConstraint {
        
        return to(width: size.width, height: size.height)
    }
    
}

// MARK: - Superview Targets

private func constrainable(for view: UIView, target: LayoutSuperviewTarget)
-> LayoutConstrainable {
    
    guard let sv = view.superview else {
        fatalError("Attempting to add constraint to null superview")
    }
    
    switch target {
    case .super: return sv
    case .safeArea: return sv.safeAreaLayoutGuide
    case .margins: return sv.layoutMarginsGuide
    case .readableContent: return sv.readableContentGuide
    }
}
