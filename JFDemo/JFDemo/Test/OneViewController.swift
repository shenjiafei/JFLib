//
//  OneViewController.swift
//  JFDemo
//
//  Created by shenjiafei on 2021/12/22.
//  Copyright © 2021 shenjiafei. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {

    var needsLightContent = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
//        let childVC = ChildViewController.init()
//        self.view.addSubview(childVC.view)
//        self.addChildViewController(childVC)
       
      
        
    }
    //直接写
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if needsLightContent {
            return .lightContent
        } else {
            return .default
        }
    }
    
    private func changeStyle() {
        needsLightContent = !needsLightContent
        setNeedsStatusBarAppearanceUpdate()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let secVC = SecViewController.init();
    
//        let secVC = FirstViewController.init();
//        let navVC = UINavigationController.init(rootViewController: secVC)
//        navVC.modalPresentationStyle = .fullScreen
//        navVC.navigationBar.barStyle = .black
//        当 barStyle = .default 时，NavigationBar 显示为黑色，此时 StatusBar 显示为白色
//        当 barStyle = .black 时，NavigationBar 显示为白色，此时 StatusBar 显示为黑色
        
//        self.present(navVC
//            , animated: true, completion: nil)
        
//        changeStyle()
        
//        let vc = ObjectQuestionViewController.init()
//        self.present(vc, animated: true, completion: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    父视图要写这个，把权限分配给子视图
//    override var childViewControllerForStatusBarStyle: UIViewController? {
//        let currentChildViewController = childViewControllers[0]
//        return currentChildViewController
//    }


}
