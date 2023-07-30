//
//  HomeView.swift
//  notestcc
//
//  Created by Igor Bueno Franco on 30/07/23.
//

import SwiftUI
import CoreData
import MapKit
import UIKit
import Combine

struct HomeView: View {
    @State private var notes = [
        Note(title: "First Note", content: "This is the content of the first note.", date: Date(), location: CLLocationCoordinate2D(latitude: 37.332331, longitude: -122.031219)),
        Note(title: "Second Note", content: "This is the content of the second note.", date: Date(), location: CLLocationCoordinate2D(latitude: 37.332331, longitude: -122.031219))
    ]
    @State private var showingAddNoteSheet = false
    @EnvironmentObject var appLockVM: AppLockViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notes.indices, id: \.self) { index in
                    NavigationLink(destination: NoteDetailView(notes: $notes, note: notes[index], noteIndex: index)) {
                    Text(notes[index].title)
                    }
                }
                .onDelete(perform: deleteNote)
            }
            .navigationBarTitle("Anotações")
            .toolbar {
                NavigationLink(destination: NotesConfigView().environmentObject(appLockVM)){
                    Image(systemName: "gear")
                }
            }
            .toolbar {
                Button(action: {
                    showingAddNoteSheet.toggle()
                }) {
                    Image(systemName: "note.text.badge.plus")
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
