//
//  NoteDetailView.swift
//  notestcc
//
//  Created by Igor Bueno Franco on 25/07/23.
//

import SwiftUI

struct NoteDetailView: View {
    let note: Note
    
    var body: some View {
        VStack {
            Text(note.content)
                .padding()
            Text(note.date.formatted())
            Spacer()
            
        }
        .navigationBarTitle(note.title)
    }
}

