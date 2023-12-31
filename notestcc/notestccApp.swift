//
//  notestccApp.swift
//  notestcc
//
//  Created by Igor Bueno Franco on 25/07/23.
//

import SwiftUI

@main
struct notestccApp: App {
    let persistenceController = PersistenceController.shared
    let appLockVM = AppLockViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appLockVM)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
