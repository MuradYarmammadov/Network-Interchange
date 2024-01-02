//
//  ContentView.swift
//  Network Interchange
//
//  Created by Murad Yarmamedov on 02.01.24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel()
    }
    
    var body: some View {
        List(userListViewModel.userList, id: \.id) { user in
            VStack {
                Text("Name: \(user.name)")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Email: \(user.email)")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Username: \(user.username)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
