//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Samuel Amante on 2/23/25.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course).font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove(perform: move)
                .onDelete(perform: delete)
            }
            .navigationBarTitle("Assignments")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                showingAddAssignmentView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddAssignmentView) {
                AddAssignmentView(assignmentList: assignmentList)
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        assignmentList.items.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
        assignmentList.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
