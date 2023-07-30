//
//  ContentView.swift
//  notestcc
//
//  Created by Igor Bueno Franco on 25/07/23.
//

import SwiftUI
import CoreData
import MapKit
import UIKit

struct ContentView: View {
    @State private var notes = [
        Note(title: "First Note", content: "This is the content of the first note.", date: Date(), location: CLLocationCoordinate2D(latitude: 37.332331, longitude: -122.031219)),
        Note(title: "Second Note", content: "This is the content of the second note.", date: Date(), location: CLLocationCoordinate2D(latitude: 37.332331, longitude: -122.031219))
    ]
    @State private var showingAddNoteSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    NavigationLink(destination: NoteDetailView(note: note)) {
                    Text(note.title)
                    }
                }
                .onDelete(perform: deleteNote)
            }
            .navigationBarTitle("Anotações")
            .toolbar {
                NavigationLink(destination: Text("sds")){
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
    
    private func deleteNote(at offsets: IndexSet) {
            notes.remove(atOffsets: offsets)
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
