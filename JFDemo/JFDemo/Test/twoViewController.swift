//
//  twoViewController.swift
//  JFDemo
//
//  Created by shenjiafei on 2021/12/22.
//  Copyright © 2021 shenjiafei. All rights reserved.
//

import UIKit

class twoViewController: UIViewController, URLSessionDelegate {

    var dataArray:NSMutableArray = NSMutableArray.init(objects: "NSData+NSURL","NSURLConnection","NSURLSession","AFHTTPSessionManager","AFURLSessionManager","LoginDemo","111","111","111","111")

    override func viewDidLoad() {
        super.viewDidLoad()
//        let label1 = UILabel(frame: CGRect(x: 27, y: 100, width: 80, height: 20))
//        label1.text = "用户名"
//        label1.font = .systemFont(ofSize: 20)
//        view.addSubview(label1)
//
//        let label2 = UILabel(frame: CGRect(x: 27, y: 140, width: 80, height: 20))
//        label2.text = "密码"
//        label2.font = .systemFont(ofSize: 20)
//        view.addSubview(label2)
//
//        let field = UITextField(frame: CGRect(x: 107, y: 100, width: 200, height: 20));
//        field.layer.borderWidth = 1
//        view.addSubview(field)
//
//        let field2 = UITextField(frame: CGRect(x: 107, y: 140, width: 200, height: 20));
//        field2.layer.borderWidth = 1
//        view.addSubview(field2)
//
//        let button = UIButton.init(frame: CGRect(x: 27, y: label2.frame.maxY + 64, width: view.frame.width - 54, height: 44))
//        button.setTitle("登录", for: .normal)
//        button.backgroundColor = .lightGray
//        button.titleLabel?.font = .systemFont(ofSize: 16)
//        button.layer.cornerRadius = 22;
//        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
//        view.addSubview(button)
        self.tableView.reloadData()
        
        
    }
    
    @objc func buttonClick(_ sender:UIButton) ->Void {
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
//        let task = session.dataTask(with: URL.init(string: "http://www.baidu.com")!)
        let ocVC = OCViewController.init()
//        self.navigationController?.pushViewController(ocVC, animated: true)
        self.present(ocVC, animated: true, completion: nil)
    }
    
//    let task = URLSession.shared.da taTask(with: url) { data, response, error in
//        dosomething()
//    }
//    task.resume()
    
//    private lazy var session: URLSession = {
//        let configuration = URLSessionConfiguration.default
//        configuration.waitsForConnectivity = true
//        return URLSession(configuration: configuration,
//                          delegate: self, delegateQueue: nil)
//    }()
//
//    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
//        self.receivedData?.append(data)
//    }

    //extension 方式实现

    lazy private var tableView:UITableView = {
        let tableView = UITableView(frame:CGRect.init(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height - 100), style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        let header = XLRefreshGifHeader.init(refreshingTarget: self, refreshingAction: #selector(loadNewData))
//        header.strokeColor = .gray
//        tableView.mj_header = header
//        tableView.mj_footer = MJRefreshBackNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(loadMoreData))
        self.view.addSubview(tableView)
        return tableView
    }()


}

extension twoViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String.init(format: "%@", self.dataArray[indexPath.row] as! CVarArg)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = self.dataArray[indexPath.row] as? String
        switch name {
        case "NSData+NSURL":
            let vc = http1ViewController.init()
            vc.title = name
            self.present(vc, animated: true, completion: nil)
            break
        case "NSURLConnection":
            let vc = http2ViewController.init()
            vc.title = name
            self.present(vc, animated: true, completion: nil)
            break
        case "NSURLSession":
            let vc = http3ViewController.init()
            vc.title = name
            self.present(vc, animated: true, completion: nil)
            break
        case "AFHTTPSessionManager":
            let vc = http4ViewController.init()
            vc.title = name
            self.present(vc, animated: true, completion: nil)
            break
        case "AFURLSessionManager":
            let vc = http5ViewController.init()
            vc.title = name
            self.present(vc, animated: true, completion: nil)
            break
        case "LoginDemo":
            let vc = LoginViewController.init()
            vc.title = name
            self.present(vc, animated: true, completion: nil)
            break
        default: break
            
        }
    }
    
}
