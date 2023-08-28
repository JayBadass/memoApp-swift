//
//  MemoClass.swift
//  memo
//
//  Created by Jongbum Lee on 2023/08/02.
//
import UIKit

var globalTodoList: [TodoItem] = []

struct TodoItem: Codable {
    var id: Int
    var title: String
    var isCompleted: Bool
    var dueDate: Date
}

extension UserDefaults {
    private static let todoListKey = "todoListKey"

    func setTodoList(_ todos: [TodoItem]) {
        if let encodedData = try? JSONEncoder().encode(todos) {
            set(encodedData, forKey: UserDefaults.todoListKey)
        }
    }

    func getTodoList() -> [TodoItem] {
        if let savedData = data(forKey: UserDefaults.todoListKey),
           let decodedTodos = try? JSONDecoder().decode([TodoItem].self, from: savedData) {
            return decodedTodos
        }
        return []
    }
}

