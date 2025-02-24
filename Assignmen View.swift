//
//  Assignmen View.swift
//  Assignment NoteBook
//
//  Created by Samuel Amante on 1/31/25.
//

import Foundation
class ToDoList: ObservableObject {
    @Published var items = [ToDoItem(priority: "High", description: "Take out trash", dueDate: Date()),
                            ToDoItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
                            ToDoItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
 }
