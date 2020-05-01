//
//  Layout.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/2/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

public enum LayoutRelation {
    case equal
    case lessOrEqual
    case greaterOrEqual
}

public enum LayoutSuperviewTarget {
    case `super`
    case safeArea
    case margins
    case readableContent
}
