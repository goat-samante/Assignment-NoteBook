//
//  AddItemView.swift
//  Assignment Notebook
//
//  Created by Samuel Amante on 2/23/25.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                TextField("Course", text: $course)
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if course.count > 0 && description.count > 0 {
                    let item = AssignmentItem(id: UUID(), course: course, description: description, dueDate: dueDate)
                    assignmentList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

#Preview {
    AddAssignmentView(assignmentList: AssignmentList())
}
