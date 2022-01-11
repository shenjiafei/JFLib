//
//  PersonInfoViewController.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2022/1/10.
//

import UIKit

struct Person {
    var name:String
    var age:Int
}

class PersonInfoViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    var person:Person?{
        didSet{
            nameLabel.text = person?.name
//            ageLabel.text = String.formatted(String) person?.age
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchPersonInfo()
    }
    
    func fetchPersonInfo() {
        let name = "jiafei"
        let age = 30
        person = Person(name: name, age: age)
    }
}
