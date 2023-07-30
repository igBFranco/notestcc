//
//  NotesConfigView.swift
//  notestcc
//
//  Created by Igor Bueno Franco on 30/07/23.
//

import SwiftUI
import Combine

struct NotesConfigView:View {
    @EnvironmentObject var appLockVM:AppLockViewModel
    var body: some View{
        NavigationView{
            Form{
                Toggle(isOn: $appLockVM.isAppLockEnabled, label: {
                    Text("Bloqueio por Biometria")
                })
                .onChange(of: appLockVM.isAppLockEnabled, perform: { value in
                    appLockVM.appLockStateChange(appLockState: value)
                })
            }
            .navigationTitle("Configurações")
        }
    }
}
