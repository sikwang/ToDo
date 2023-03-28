//
//  ToDoManager.swift
//  ToDo
//
//  Created by NHN on 2023/04/01.
//

import Foundation

protocol TodoDataManagerProtocol {
    func addTodo(_ text: String)
    func toDoCount() -> Int
    func arrayToDo() -> [ToDo]
}

final class ToDoManager: TodoDataManagerProtocol {
    
    static let shared = ToDoManager()

    private var todos: [ToDo] = []

    func addTodo(_ text: String) {
        let newToDo = ToDo(text: text, isCompleted: false)
        self.todos.append(newToDo)
    }
    
    func toDoCount() -> Int {
        return todos.count
    }
    
    func arrayToDo() -> [ToDo] {
        return todos
    }
}
