//
//  UserListViewModel.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation


final class UserListViewModel {

    private var users: [User] = []

    // MARK: - Data

    func numberOfRows() -> Int {
        return users.count
    }

    func user(at index: Int) -> User? {
        guard index < users.count else { return nil }
        return users[index]
    }

    // MARK: - Fetching

    private let decoder = JSONDecoder()

    func fetchFollowings(userID: String, completion: (() -> Void)? = nil) {
//        let url = "https://api.your_app_name.com/api/v1/users/\(userID)/followings"
//        RequestManager.request(.get, urlString: url) { [weak self] (result) in
//            switch result {
//            case .success(let data):
//
//                guard let jsonData = data,
//                    let result = try? self?.decoder.decode(UsersResults.self, from: jsonData),
//                    let users = result.users else {
//                        self?.users = []
//                        return
//                }
//                self?.users = users
//
//            case .failure(let error):
//                self?.users = []
//            }
//        }
    }
}
