//
//  FZStringViewController.swift
//  JFDemo
//
//  Created by shenjiafei on 2022/1/13.
//  Copyright © 2022 shenjiafei. All rights reserved.
//

import UIKit

class FZStringViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(self.reverseWords("hello world jiafei "))
    }
    
    func reverseWords(_ s: String) -> String {
            return s.split { $0.isWhitespace }.reversed().joined(separator: " ")
    }


}
