//
//  NoteDetailView.swift
//  notestcc
//
//  Created by Igor Bueno Franco on 25/07/23.
//

import SwiftUI
import MapKit

struct NoteDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingEditNoteSheet = false
    @State private var showingAlert = false
    @Binding var notes: [Note]
    let note: Note
    let noteIndex: Int
    
    var body: some View {
        NavigationStack {
            Text(note.content)
            if let image = note.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .frame(height: 200)
            }
            if let location = note.location {
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))))
                    .frame(height: 200)
                    .cornerRadius(10)
                    .padding(20)
            }
            Text(note.date.formatted())
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Spacer()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                       showingAlert = true
                    }) {
                        Image(systemName: "trash").foregroundColor(Color.red)
                    }.alert("Deseja realemente excluir a anotação?", isPresented: $showingAlert) {
                        Button("Cancelar", role: .cancel) {
                            showingAlert = false
                        }
                        Button("Excluir", role: .destructive) {
                            deleteNote()
                            showingAlert = false
                        }
                    }
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Editar", action: {
                    showingEditNoteSheet.toggle()
                })
            }
        }
        .navigationBarTitle(note.title)
        .sheet(isPresented: $showingEditNoteSheet) {
            EditNoteView(notes: $notes)
        }
    }
    private func deleteNote() {
        notes.remove(at: noteIndex)
        presentationMode.wrappedValue.dismiss()
    }
}

