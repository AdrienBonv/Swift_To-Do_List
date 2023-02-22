//
//  TodoListApp.swift
//  TodoList
//
//  Created by Adrien BONVALLET on 13/02/2023.
//

import SwiftUI

@main
struct TodoListApp: App {

    var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
