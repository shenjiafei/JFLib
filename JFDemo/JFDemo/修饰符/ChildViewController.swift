//
//  ChildViewController.swift
//  Hello
//
//  Created by shenjiafei on 2021/11/25.
//  Copyright © 2021 CodingFire. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    
    var needsLightContent = false

    override func viewDidLoad() {
        super.viewDidLoad()
            view.backgroundColor = .lightGray
        
        let button = UIButton.init(frame: CGRect(x: 27, y: 100, width: view.frame.width - 54, height: 44))
        button.setTitle("改变状态颜色", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 22;
        button.addTarget(self, action: #selector(changeStyle), for: .touchUpInside)
        view.addSubview(button)

    }
    
//    nav 环境下，这个无效的
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if needsLightContent {
            return .lightContent
        } else {
            return .default
        }
    }
    
    @objc func changeStyle() {
//        needsLightContent = !needsLightContent
//        setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.navigationBar.barStyle = .default
//        注意，这里变了以后，如果要保持原样，就需要变回去
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.barStyle = .black
    }

    
}
