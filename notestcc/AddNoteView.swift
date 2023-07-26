//
//  AddNoteView.swift
//  notestcc
//
//  Created by Igor Bueno Franco on 25/07/23.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var notes: [Note]
    @State private var newNoteTitle = ""
    @State private var newNoteContent = ""
    @State private var newNoteDate = Date()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Note Title", text: $newNoteTitle)
                TextEditor(text: $newNoteContent)
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            }
            .navigationBarTitle("Add Note")
            .navigationBarItems(trailing:
                Button("Save") {
                    let newNote = Note(title: newNoteTitle, content: newNoteContent, date: newNoteDate)
                    notes.append(newNote)
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}
