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
    @State private var selectedImage: UIImage?
    @State private var locationManager = CLLocationManager()
    @State private var userLocation: CLLocationCoordinate2D?
    
    @State private var isImagePickerPresented = false

    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Título")){
                    TextField("", text: $newNoteTitle).foregroundColor(Color.gray)
                }
                Section(header: Text("Conteúdo")){
                    TextEditor(text: $newNoteContent).foregroundColor(Color.gray)
                }
                Section(header: Text("Data")){
                    DatePicker("", selection: $newNoteDate,in: ...Date())
                }
                Section(header: Text("Imagem")){
                    Button("Adicionar Imagem") {
                        isImagePickerPresented.toggle()
                    }
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(height: 200)
                    }
                }
                Section(header: Text("Localização")){
                    Map(coordinateRegion: .constant(MKCoordinateRegion(center: selectedLocation ?? CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))))
                                       .frame(height: 200)
                                       .cornerRadius(10)
                                   
                    Button("Selecionar Localização") {
                        selectedLocation = CLLocationCoordinate2D(latitude: 37.332331, longitude: -122.031219)
                    }
                }
                
            }
            .navigationBarTitle("Adicionar Nota")
            .navigationBarItems(trailing:
                Button("Salvar") {
                let newNote = Note(title: newNoteTitle, content: newNoteContent, date: newNoteDate, location: selectedLocation, image: selectedImage)
                notes.append(newNote)
                presentationMode.wrappedValue.dismiss()
                }
            )
            .sheet(isPresented: $isImagePickerPresented, onDismiss: loadImage) {
                ImagePicker(image: $selectedImage)
            }
        }
    }
    
    private func loadImage() {
           guard let selectedImage = selectedImage else { return }
       }
    
}
