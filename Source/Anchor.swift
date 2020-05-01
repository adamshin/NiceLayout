//
//  Anchor.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/1/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

// MARK: - Anchor Protocols

protocol LayoutAnchor {
    var attribute: NSLayoutConstraint.Attribute { get }
}

protocol LayoutEdgeAnchor: LayoutAnchor { }

protocol LayoutCompositeAnchor {
    var attributes: [NSLayoutConstraint.Attribute] { get }
}

// MARK: - Anchors

enum LayoutXAxisAnchor: LayoutEdgeAnchor {
    case leading
    case trailing
    case left
    case right
    case centerX
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .leading: return .leading
        case .trailing: return .trailing
        case .left: return .left
        case .right: return .right
        case .centerX: return .centerX
        }
    }
}

enum LayoutYAxisAnchor: LayoutEdgeAnchor {
    case top
    case bottom
    case centerY
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .top: return .top
        case .bottom: return .bottom
        case .centerY: return .centerY
        }
    }
}

enum LayoutDimensionAnchor: LayoutAnchor {
    case width
    case height
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .width: return .width
        case .height: return .height
        }
    }
}

// MARK: - Composite Anchors

enum LayoutCompositeEdgeAnchor: LayoutCompositeAnchor {
    case edges
    case hEdges
    case vEdges
    
    var attributes: [NSLayoutConstraint.Attribute] {
        switch self {
        case .edges: return [.leading, .trailing, .top, .bottom]
        case .hEdges: return [.leading, .trailing]
        case .vEdges: return [.top, .bottom]
        }
    }
}

enum LayoutCompositeCenterAnchor: LayoutCompositeAnchor {
    case center
    
    var attributes: [NSLayoutConstraint.Attribute] {
        switch self {
        case .center: return [.centerX, .centerY]
        }
    }
}

enum LayoutCompositeSizeAnchor: LayoutCompositeAnchor {
    case size
    
    var attributes: [NSLayoutConstraint.Attribute] {
        switch self {
        case .size: return [.width, .height]
        }
    }
}
