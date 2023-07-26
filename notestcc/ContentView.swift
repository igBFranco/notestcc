//
//  ContentView.swift
//  notestcc
//
//  Created by Igor Bueno Franco on 25/07/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var notes = [
        Note(title: "First Note", content: "This is the content of the first note.", date: Date()),
        Note(title: "Second Note", content: "This is the content of the second note.", date: Date())
    ]
    
    @State private var showingAddNoteSheet = false
    
    var body: some View {
        NavigationView {
            List(notes) { note in
                NavigationLink(destination: NoteDetailView(note: note)) {
                    Text(note.title)
                }
            }
            .navigationBarTitle("Anotações")
            .toolbar {
                Button(action: {
                    showingAddNoteSheet.toggle()
                }) {
                    Image(systemName: "gear")
                }
            }
            .toolbar {
                Button(action: {
                    showingAddNoteSheet.toggle()
                }) {
                    Image(systemName: "plus.app.fill")
                }
            }
            
        }
        .sheet(isPresented: $showingAddNoteSheet) {
            AddNoteView(notes: $notes)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
