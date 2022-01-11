//
//  MenuViewController.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    func menuViewController(_ menuViewController: MenuViewController,
                            didSelectItem item: MenuItem)
}

enum MenuItem: String {
    case home = "首页"
    case me = "我的"
    case settings = "设置"
}

class MenuViewController: UIViewController {

    weak var delegate: MenuViewControllerDelegate?

    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    private let items: [MenuItem] = [.home, .me, .settings]
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = items[indexPath.row].rawValue
            return cell
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        delegate?.menuViewController(self, didSelectItem: item)
    }
}
