//
//  AddReminderView.swift
//  TodoListApp
//
//  Created by Phạm Trường Giang on 4/1/25.
//

import SwiftUI


struct AddReminderView: View {
  enum FocusableField: Hashable {
    case title
  }


  @FocusState
  private var focusedField: FocusableField?


  @State
  private var reminder = Reminder(title: "")


  @Environment(\.dismiss)
  private var dismiss


  var onCommit: (_ reminder: Reminder) -> Void


  private func commit() {
    onCommit(reminder)
    dismiss()
  }


  private func cancel() {
    dismiss()
  }


  var body: some View {
    NavigationStack {
      Form {
        TextField("Title", text: $reminder.title)
          .focused($focusedField, equals: .title)
      }
      .navigationTitle("New Reminder")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button(action: cancel) {
            Text("Cancel")
          }
        }
        ToolbarItem(placement: .confirmationAction) {
          Button(action: commit) {
            Text("Add")
          }
          .disabled(reminder.title.isEmpty)
        }
      }
      .onAppear {
        focusedField = .title
      }
    }
  }
}


struct AddReminderView_Previews: PreviewProvider {
  static var previews: some View {
    AddReminderView { reminder in
      print("You added a new reminder titled \(reminder.title)")
    }
  }
}
