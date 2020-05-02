//
//  Layout.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/2/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

// MARK: - Superview Target

public enum LayoutSuperviewTarget {
    case `super`
    case margins
    case readableContent
    @available(iOS 11.0, *) case safeArea
}

// MARK: - Relation Operators

public struct LayoutRelationProxy { }

public typealias LayoutRelationOperator =
    (LayoutRelationProxy, LayoutRelationProxy)
    -> NSLayoutConstraint.Relation

public func == (a: LayoutRelationProxy, b: LayoutRelationProxy)
-> NSLayoutConstraint.Relation {
    return .equal
}

public func <= (a: LayoutRelationProxy, b: LayoutRelationProxy)
-> NSLayoutConstraint.Relation {
    return .lessThanOrEqual
}

public func >= (a: LayoutRelationProxy, b: LayoutRelationProxy)
-> NSLayoutConstraint.Relation {
    return .greaterThanOrEqual
}
