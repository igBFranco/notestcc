//
//  NoteDetailView.swift
//  notestcc
//
//  Created by Igor Bueno Franco on 25/07/23.
//

import SwiftUI
import MapKit

struct NoteDetailView: View {
    let note: Note
    
    var body: some View {
        VStack {
            Text(note.content)
                .padding()
            Text(note.date.formatted())
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
                        }
            Spacer()
        }
        .navigationBarTitle(note.title)
    }
}

