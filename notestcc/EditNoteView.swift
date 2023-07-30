//
//  EditNoteView.swift
//  notestcc
//
//  Created by Igor Bueno Franco on 30/07/23.
//


import SwiftUI
import MapKit
import CoreLocation
import UIKit

struct EditNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var notes: [Note]
    @State private var editNoteTitle = ""
    @State private var editNoteContent = ""
    @State private var editNoteDate = Date()
    @State private var editselectedLocation: CLLocationCoordinate2D? = nil
    @State private var editselectedImage: UIImage?
    @State private var editlocationManager = CLLocationManager()
    @State private var edituserLocation: CLLocationCoordinate2D?
    
    @State private var isImagePickerPresented = false

    
    var body: some View {
        NavigationView {
            Form {
                TextField("Título", text: $editNoteTitle).foregroundColor(Color.gray)
                TextEditor(text: $editNoteContent).foregroundColor(Color.gray)
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("Data") })
                
                if let image = editselectedImage {
                                   Image(uiImage: image)
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .cornerRadius(10)
                                       .frame(height: 200)
                               }
                Button("Adicionar Imagem") {
                    isImagePickerPresented.toggle()
                }
                
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: editselectedLocation ?? CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))))
                                   .frame(height: 200)
                                   .cornerRadius(10)
                               
                               Button("Selecionar Localização") {
                                   editselectedLocation = CLLocationCoordinate2D(latitude: 37.332331, longitude: -122.031219)
                               }
            }
            .navigationBarTitle("Editar Nota")
            .navigationBarItems(trailing:
                Button("Salvar") {
                let editedNote = Note(title: editNoteTitle, content: editNoteContent, date: editNoteDate, location: editselectedLocation, image: editselectedImage)
                notes.append(editedNote)
                presentationMode.wrappedValue.dismiss()
                }
            )
            .sheet(isPresented: $isImagePickerPresented, onDismiss: loadImage) {
                ImagePicker(image: $editselectedImage)
            }
        }
    }
    
    private func loadImage() {
           guard let selectedImage = editselectedImage else { return }
       }
    
}
