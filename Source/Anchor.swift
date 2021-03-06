//
//  Anchor.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/1/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

// MARK: - Anchor Protocols

public protocol LayoutAnchor {
    var attribute: NSLayoutConstraint.Attribute { get }
}

public protocol LayoutCompositeAnchor {
    var attributes: [NSLayoutConstraint.Attribute] { get }
}

// MARK: - Anchors

public protocol LayoutEdgeAnchor: LayoutAnchor { }

public enum LayoutXAxisAnchor: LayoutEdgeAnchor {
    case leading
    case trailing
    case left
    case right
    case centerX
    
    public var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .leading: return .leading
        case .trailing: return .trailing
        case .left: return .left
        case .right: return .right
        case .centerX: return .centerX
        }
    }
}

public enum LayoutYAxisAnchor: LayoutEdgeAnchor {
    case top
    case bottom
    case centerY
    
    public var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .top: return .top
        case .bottom: return .bottom
        case .centerY: return .centerY
        }
    }
}

public enum LayoutSizeAnchor: LayoutAnchor {
    case width
    case height
    
    public var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .width: return .width
        case .height: return .height
        }
    }
}

// MARK: - Composite Anchors

public enum LayoutCompositeEdgeAnchor: LayoutCompositeAnchor {
    case edges
    case hEdges
    case vEdges
    
    case topLeading
    case topTrailing
    case bottomLeading
    case bottomTrailing
    
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    
    public var attributes: [NSLayoutConstraint.Attribute] {
        switch self {
        case .edges: return [.leading, .trailing, .top, .bottom]
        case .hEdges: return [.leading, .trailing]
        case .vEdges: return [.top, .bottom]
        
        case .topLeading: return [.top, .leading]
        case .topTrailing: return [.top, .trailing]
        case .bottomLeading: return [.bottom, .leading]
        case .bottomTrailing: return [.bottom, .trailing]
        
        case .topLeft: return [.top, .left]
        case .topRight: return [.top, .right]
        case .bottomLeft: return [.bottom, .left]
        case .bottomRight: return [.bottom, .right]
        }
    }
}

public enum LayoutCompositeCenterAnchor: LayoutCompositeAnchor {
    case center
    
    public var attributes: [NSLayoutConstraint.Attribute] {
        switch self {
        case .center: return [.centerX, .centerY]
        }
    }
}

public enum LayoutCompositeSizeAnchor: LayoutCompositeAnchor {
    case size
    
    public var attributes: [NSLayoutConstraint.Attribute] {
        switch self {
        case .size: return [.width, .height]
        }
    }
}
