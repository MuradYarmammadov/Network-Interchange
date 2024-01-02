//
//  UserViewModel.swift
//  Network Interchange
//
//  Created by Murad Yarmamedov on 02.01.24.
//

import Foundation

class UserListViewModel: ObservableObject {
    
    @Published var userList = [UserViewModel]()
    
    private var service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func downloadUsers() async {
        
        var resource = ""
        
        if service.type == .WebService {
            resource = NetworkConstants.Urls.usersExtension
        } else {
            resource = NetworkConstants.Paths.baseURL
        }
        
        do {
            let users = try await service.download(resource)
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
