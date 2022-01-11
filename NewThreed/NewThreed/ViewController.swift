//
//  ViewController.swift
//  NewThreed
//
//  Created by shenjiafei on 2022/1/11.
//

import UIKit
import Alamofire
//import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
 
    func getData() {
        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
        }
        
        AF.request("https://httpbin.org/get")
        AF.request("https://httpbin.org/post", method: .post)
        AF.request("https://httpbin.org/put", method: .put)
        AF.request("https://httpbin.org/delete", method: .delete)
    }
    
    func demo() {
        struct Login: Encodable {
            let email: String
            let password: String
        }

        let login = Login(email: "test@test.test", password: "testPassword")

        AF.request("https://httpbin.org/post",
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }

    }
    
    func startLoad(){
        let url =  "https://github.com/xiaoyouxinqing/PostDemo/raw/master/PostDemo/Resources/PostListData_recommend_1.json"
        
        AF.request(url).responseData{ respone in
            switch respone.result{
            case let .success(data): //如果返回成功则赋值给临时变量 data
//                guard let list = try? JSONDecoder().decode(PostList.self, from: data) else{
//                    self.updateText("Can not parse data")
//                    return
//                }
//                self.updateText("Post count\(list.list.count)")
                break
            case let .failure(error):  //如果返回失败则赋值给临时变量 error
//                self.updateText(error.errorDescription!)
                break
            }
        }
    }

}

