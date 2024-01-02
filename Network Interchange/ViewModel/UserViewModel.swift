//
//  UserViewModel.swift
//  Network Interchange
//
//  Created by Murad Yarmamedov on 02.01.24.
//

import Foundation

class UserListViewModel: ObservableObject {
    
    @Published var userList = [UserViewModel]()
    
    let webService = WebService()
    
    
    func downloadUsers() async {
        do {
            let users = try await webService.download(NetworkConstants.Urls.usersExtension)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        } catch {
            print(error)
        }
    }
}

struct UserViewModel {
    let user: User
    
    var id: Int {
        user.id
    }
    
    var name: String {
        user.name
    }
    
    var username: String {
        user.username
    }
    
    var email: String {
        user.email
    }
}
