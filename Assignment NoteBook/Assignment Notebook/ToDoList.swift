//
//  ToDoList.swift
//  Assignment Notebook
//
//  Created by Samuel Amante on 2/23/25.
//

import Foundation
class AssignmentList: ObservableObject {
    @Published var items: [AssignmentItem] = [] {
        didSet {
            if let encodedData = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedData, forKey: "assignments")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "assignments") {
            if let decodedData = try? JSONDecoder().decode([AssignmentItem].self, from: data) {
                items = decodedData
                return
            }
        }
        items = []
    }
}
