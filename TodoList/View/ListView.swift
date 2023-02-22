//
//  ListView.swift
//  TodoList
//
//  Created by Adrien BONVALLET on 13/02/2023.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) {item in
                if (!item.isCompleted) {
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.none) {
                                listViewModel.updateItem(item: item)
                            }
                        }
                }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
            ForEach(listViewModel.items) { item in
                if (item.isCompleted) {
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.none) {
                                listViewModel.updateItem(item: item)
                            }
                        }
                }
            }
        }
        .navigationTitle("Todo List 😄")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
