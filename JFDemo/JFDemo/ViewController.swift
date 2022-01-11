//
//  ViewController.swift
//  JFDemo
//
//  Created by shenjiafei on 2021/2/23.
//  Copyright © 2021 shenjiafei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isHidden = false
        
//        let cal = JFCalculator.init()
//        cal.add(40.0)
        
    }

    //extension 方式实现

    lazy private var tableView:UITableView = {
        let tableView = UITableView(frame:CGRect.init(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height - 100), style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .lightGray
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.view.addSubview(tableView)
        return tableView
    }()
}

extension
ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "11"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TestViewController()
        let navVC = UINavigationController.init(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
//        navigationController?.pushViewController(navVC, animated: true)
    }
    
}
