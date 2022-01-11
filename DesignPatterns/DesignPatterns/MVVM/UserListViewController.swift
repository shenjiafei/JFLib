//
//  UserListViewController.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation
import UIKit

final class UserListViewController: UIViewController {

    private let viewModel: UserListViewModel

    // MARK: - Initializers

    init(withViewModel vm: UserListViewModel) {
        viewModel = vm
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Views

    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        return tv
    }()

    // MARK: - View LifeCycles

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        addTableView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let userID = "xxxxxxxxxxxxxx"
        viewModel.fetchFollowings(userID: userID) { [weak self] in
            self?.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UITableViewDataSource
extension UserListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = viewModel.user(at: indexPath.row)
        cell.textLabel?.text = user?.username
        return cell
    }
}

// MARK: - Setup Subviews
extension UserListViewController {
    private func addTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
}
