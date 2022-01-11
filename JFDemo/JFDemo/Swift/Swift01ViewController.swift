//
//  Swift01ViewController.swift
//  JFDemo
//
//  Created by shenjiafei on 2022/1/11.
//  Copyright © 2022 shenjiafei. All rights reserved.
//

import UIKit

class Swift01ViewController: UIViewController {
    
    var number:Float = 10
    var name  :String = "xxx"

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = 10
        let b = 3.14
    //    let c = a + b 不同类型不能操作
        let c = Double(a) + b
        print("%f",c)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
