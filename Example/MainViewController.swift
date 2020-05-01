//
//  MainViewController.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/1/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let view1 = UIView()
        view1.backgroundColor = .red
        view.addSubview(view1)
        view1.layout {
            $0.pin(.centerX).to(.super)
            $0.pin(.width).to(.super).multiplier(0.5)
            $0.pin(.top).to(.super).inset(140)
            $0.pin(.height).to(100).priority(900)
        }
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        view.addSubview(view2)
        view2.layout {
            $0.pin(.hEdges).to(view1)
            $0.pin(.top).to(view1, .bottom).offset(20)
            $0.pin(.height).to(60)
        }
        
        let view3 = UIView()
        view3.backgroundColor = .green
        view.addSubview(view3)
        view3.pin(.edges).to(view2).inset(10)
        
        let view4 = UIView()
        view4.backgroundColor = .orange
        view.addSubview(view4)
        view4.layout {
            $0.pin(.leading).to(.safeArea).inset(24)
            $0.pin(.top).to(.safeArea).inset(24)
            $0.pin(.size).to(width: 88, height: 44)
        }
        
        let view5 = UIView()
        view5.backgroundColor = .purple
        view.addSubview(view5)
        view5.layout {
            $0.pin(.leading).to(view2, .trailing).offset(20)
            $0.pin(.vEdges).to(view2)
            $0.pin(.width).to($0, .height).multiplier(1)
        }
    }
    
}
