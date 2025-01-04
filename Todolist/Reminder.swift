//
//  Reminder.swift
//  TodoListApp
//
//  Created by Phạm Trường Giang on 4/1/25.
//

import Foundation

struct Reminder: Identifiable {
  let id = UUID()
  var title: String
  var isCompleted = false
}


extension Reminder {
  static let samples = [
    Reminder(title: "Nguyen Van A", isCompleted: true),
    Reminder(title: "Tran Van B"),
    Reminder(title: "Hứa Thị C"),
    Reminder(title: "Ptit mãi đỉnh"),
  ]
}
