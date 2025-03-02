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
                .onMove(perform: { indices, newOffset in
                    assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentList.items.remove(atOffsets: indexSet)
                })
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
}
#Preview {
    ContentView()
}
struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course: String
    var description: String
    var dueDate: Date
}
