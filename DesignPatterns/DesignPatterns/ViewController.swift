//
//  ViewController.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import UIKit

class ViewController: UIViewController {

    lazy private var tableView:UITableView = {
        let tableView = UITableView(frame:CGRect.init(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height - 100), style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.view.addSubview(tableView)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
}
//        MVVM:
//        let viewModel = UserListViewModel.init()
//
//        let UserListViewController = UserListViewController.init(withViewModel: viewModel)
//        self.navigationController?.pushViewController(UserListViewController, animated: true)
//
//        //自动根据client 类型初始化
//        let client = DianPingClient.init()
//        let vc = FoodMerchantRatingViewController.init(withRaingClient: client)
//        self.navigationController?.pushViewController(vc, animated: true)
        
        
//        let obVC = ObserverViewController.init()
//        self.present(obVC, animated: true, completion: nil)
//        self.navigationController?.pushViewController(obVC, animated: true)
        
//        //备忘录模式
//        let game1 = Game()
//        game1.earnSomePoints()
//        game1.enterNextLebrl()
//
//        let gameSystem = GameSystem()
//        try? gameSystem.save(game1, for: "player1")
//
//
//
//        let game2 = Game()
//        print("第二个玩家的分数: \(game2.state.score)") // 第二个玩家的分数: 0
//
//        //原来的账户
//        var restoredGame1 = try! gameSystem.loadGame(for: "player1")
////        print("第一个玩家的分数: \(restoredGame1?.state.score ?? "nil")")
//        // 第一个玩家的分数: 100

        //建造者模式 汉堡包
//        当创建对象时，需要通过一系列的步骤来传入参数时，非常适合使用建造者模式。
//        let employee = Employee()
//
//        let beefHamburger = employee.createBeefHamburger()
//        print(beefHamburger.description) // beef hamburger
//
//        let chickenHamburger = employee.createChickenHamburger()
//        print(chickenHamburger.description) // chicken hamburger
        
        
//        当想要把实例的创建逻辑独立出来，可以使用工厂模式。但如果想要的实例非常简单，直接在用到的地方直接创建即可。如果这个实例需要一系列的步骤才能创建，最好使用Builder模式。
        
//        求职者
//        let lebron = JobApplicant(name: "Lebron James",
//                                  email: "lebronjames@example.com",
//                                  status: .hired)
//
//        let emailFactory = EmailFactory(senderEmail: "hr@company.com")
//        let emial = emailFactory.createEmail(to: lebron)
//        print(emial.description)
        
        //适配器模式
//        let authService = WeiboAuthenticatorAdapter()
//        authService.login(email: "test@example.com",
//                          password: "password",
//                          success: { (user, token) in
//                            print("登录成功： 1) 邮件：\(user.email), 2）token: \(token.value)")
//        },
//                          failure: { (error) in
//                            print("登录失败：\(error?.localizedDescription ?? "")")
//        })
        
        
//        //迭代器模式
//        struct Person {
//            let name: String
//        }
//
//        let lebron = Person(name: "Lebron James")
//        let love = Person(name: "Kevin Love")
//        let korver = Person(name: "Kyle Korver")
//
//        // 入队
//        var queue = Queue<Person>()
//        queue.enqueue(lebron)
//        queue.enqueue(love)
//        queue.enqueue(korver)
//
//        // 出队
//        queue.dequeue()
//
//        for person in queue {
//            print(person?.name ?? "此人不存在")
//        }
        // 结果
//        Kevin Love
//        Kyle Korver
        
//        通过遵循Sequence来实现，好处是我们不需要自己自定义一个迭代器，而且还可以获得集合的很多方法，例如filter、map和sort等等。
//        queue.filter(<#T##isIncluded: (Person?) throws -> Bool##(Person?) throws -> Bool#>)
//        queue.map(<#T##transform: (Person?) throws -> T##(Person?) throws -> T#>)
//        queue.sorted(by: <#T##(Person?, Person?) throws -> Bool#>)
        

        //原型模式 相当于实现了一次深拷贝
//        let pet1 = Pet(name: "Lili", weight: 10)
//        let pet2 = pet1.copy()
//        let pet3 = pet1.copy()
//        pet3.name = "小黑"
//        pet3.weight = 11
//        print("pet1====name: \(pet1.name)====weight: \(pet1.weight)")
//        print("pet2====name: \(pet2.name)====weight: \(pet2.weight)")
//        print("pet3====name: \(pet3.name)====weight: \(pet3.weight)")


//        let person = User(userID: "1222", username: "王守义")
//        let person2 = person.copy() 并没有实现拷贝协议

//        状态模式： 红绿灯自动切换
//        let frame = CGRect(x: 100, y: 100, width: 150, height: 400)
//        //这里不是枚举，这里是方法合集
//        let lights: [SolidTrafficLightState] =
//            [.greenLight(), .yellowLight(), .redLight()]
//        let trafficLight = TrafficLightView(frame: frame, states: lights)
//        view.addSubview(trafficLight)

//        多播委托模式
//        let securityCenter = SecurityCenter.shared
//        var fireStation: FireStation! = FireStation()
//        let hospital = HospitalEmergencyCenter()
//
//        securityCenter.multicastDelegate.addDelegate(fireStation)
//        securityCenter.multicastDelegate.addDelegate(hospital)
//
//        securityCenter.multicastDelegate.notifyDelegates {
//            $0.notifyFire(at: "特朗普大厦")
//        }
//
//        print("======分割线======")
//
//        fireStation = nil
//
//        securityCenter.multicastDelegate.notifyDelegates {
//            $0.notifyFire(at: "特朗普大厦")
//        }
//
//        // 结果
////        已经通知消防员在特朗普大厦发生了火灾
////        已经通知医护人员在特朗普大厦发生了火灾
////        ======分割线======
////        已经通知医护人员在特朗普大厦发生了火灾

//        门面模式
//        let cola = Product(id: UUID().uuidString, name: "可乐", price: 3)
//        let sprite = Product(id: UUID().uuidString, name: "雪碧", price: 3)
//
//        let inventoryDatabase = InventoryDatabase(inventory: [cola: 10, sprite: 10])
//        let shippingDatabase = ShippingDatabase()
//
//        let orderFacade = OrderFacade(inventoryDatabase: inventoryDatabase,
//                                      shippingDatabase: shippingDatabase)
//
//        let customer = Customer(id: UUID().uuidString,
//                                address: "深圳南山区xx街道xx小区10栋",
//                                name: "Lebron James")
//
//        orderFacade.placeOrder(for: cola, by: customer)
//
//        // 打印
////        Lebron James购买了可乐

//        享元模式 复用内存
//        let font1 = UIFont.SFUITextFont(style: .heavy, size: 20)
//        let font2 = UIFont.SFUITextFont(style: .heavy, size: 20)
//        print(font1 == font2)  // true

//        中介者模式  类似对讲机模式
//        当我们想把多个对象之间复杂的交互关系，简化成通过一个对象进行处理时，使用这个模式
//        使得对象之间不需要直接沟通，减少对象之间的耦合性。
//        let mediator = SecurityStaffMediator()
//        let zhangSan = SecurityStaff(name: "张三", mediator: mediator)
//        let liSi = SecurityStaff(name: "李四", mediator: mediator)
//        let wangWu = SecurityStaff(name: "王五", mediator: mediator)
//
//
//        zhangSan.sendMessage("大厅有人抢劫")
//        print("")
//
//        liSi.sendMessage("我马上过去看看")
//        print("")
//
//        wangWu.sendMessage("我马上过去看看")

        // 结果
//        张三 发送：大厅有人抢劫
//        李四 收到: 大厅有人抢劫
//        王五 收到: 大厅有人抢劫
//
//        李四 发送：我马上过去看看
//        张三 收到: 我马上过去看看
//        王五 收到: 我马上过去看看
//
//        王五 发送：我马上过去看看
//        张三 收到: 我马上过去看看
//        李四 收到: 我马上过去看看

        //组合模式
        // 创建两个文件夹
//        let desktop = Folder(name: "桌面")
//        let musicFolder = Folder(name: "我最爱的音乐")
//
//        // 创建具体的文件
//        let iOSDesignPattern = PDF(name: "iOS设计模式")
//
//        let diYiCi = Music(name: "第一次", artist: "光良")
//        let liXiang = Music(name: "理想", artist: "赵雷")
//
//        // 桌面文件夹添加音乐文件夹和 PDF 文件
//        desktop.addFile(musicFolder)
//        desktop.addFile(iOSDesignPattern)
//
//        // 把两个音乐添加到音乐文件夹
//        musicFolder.addFile(diYiCi)
//        musicFolder.addFile(liXiang)
//
//        // 打开文件
//        iOSDesignPattern.open()
//        liXiang.open()
//
//        // 打开文件夹
//        desktop.open()
//        musicFolder.open()


        // 结果
//        正在打开iOS设计模式
//        正在播放赵雷的理想
//
//        正在显示以下文件：
//        --- 我最爱的音乐
//        --- iOS设计模式
//
//        正在显示以下文件：
//        --- 第一次
//        --- 理想

//        let door = Door()
//        let doorman = Doorman(door: door)
//
//        doorman.openDoor()
//        doorman.closeDoor()

        // 结果
//        正在开门
//        正在关门

//        责任链模式
//        let fiveYuanHandler = RMBHandler(rmbType: FiveYuan.self)
//        let tenYuanHandler = RMBHandler(rmbType: TenYuan.self)
//        let twentyYuanHandler = RMBHandler(rmbType: TwentyYuan.self)
//
//        fiveYuanHandler.next = tenYuanHandler
//        tenYuanHandler.next = twentyYuanHandler
//
//        let vendingMachine = VendingMachine(rmbHandler: fiveYuanHandler)
//
//
//        let fiveYuan = FiveYuan()
//        vendingMachine.insertRMB(fiveYuan)

        // 结果
//        尝试创建RMB：FiveYuan
//        已创建纸币，长：135.0，宽：63.0，面值：5.0元
//        纸币已接收
//        已投币总金额：5.0元

//        let twentyYuan = TwentyYuan()
//        vendingMachine.insertRMB(twentyYuan)

        // 结果
//        尝试创建RMB：FiveYuan
//        长度不符合要求
//        尝试创建RMB：TenYuan
//        长度不符合要求
//        尝试创建RMB：TwentyYuan
//        已创建纸币，长：145.0，宽：70.0，面值：20.0元
//        纸币已接收
//        已投币总金额：20.0元

//        let rmb = RMB(width: TwentyYuan.standardWidth,
//                      height: FiveYuan.standardHeight)
//        vendingMachine.insertRMB(rmb)

        // 结果
//        尝试创建RMB：FiveYuan
//        长度不符合要求
//        尝试创建RMB：TenYuan
//        长度不符合要求
//        尝试创建RMB：TwentyYuan
//        宽度不符合要求
//        无效的纸币: 长：145.0，宽：63.0，面值：0.0元


extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        cell.textLabel?.text = "观察者模式"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //观察者模式
//        let obVC = ObserverViewController.init()
//        self.present(obVC, animated: true, completion: nil)
        
        //工厂模式
//        let lebron = JobApplicant(name: "Lebron James",
//                                  email: "lebronjames@example.com",
//                                  status: .hired)
//
//        let emailFactory = EmailFactory(senderEmail: "hr@company.com")
//        let emial = emailFactory.createEmail(to: lebron)
//        print(emial.description)
    }
    
}
