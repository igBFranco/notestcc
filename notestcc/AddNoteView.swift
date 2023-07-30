//
//  AddNoteView.swift
//  notestcc
//
//  Created by Igor Bueno Franco on 25/07/23.
//

import SwiftUI
import MapKit
import CoreLocation
import UIKit

struct AddNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var notes: [Note]
    @State private var newNoteTitle = ""
    @State private var newNoteContent = ""
    @State private var newNoteDate = Date()
    @State private var selectedLocation: CLLocationCoordinate2D? = nil
    
    @State private var locationManager = CLLocationManager()
    @State private var userLocation: CLLocationCoordinate2D?

    
    var body: some View {
        NavigationView {
            Form {
                TextField("Note Title", text: $newNoteTitle)
                TextEditor(text: $newNoteContent)
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: selectedLocation ?? CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))))
                                   .frame(height: 200)
                                   .cornerRadius(10)
                               
                               Button("Select Location") {
                                   selectedLocation = CLLocationCoordinate2D(latitude: 37.332331, longitude: -122.031219)
                               }
            }
            .navigationBarTitle("Add Note")
            .navigationBarItems(trailing:
                Button("Save") {
                    let newNote = Note(title: newNoteTitle, content: newNoteContent, date: newNoteDate, location: selectedLocation)
                    notes.append(newNote)
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
    
}
