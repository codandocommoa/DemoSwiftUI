//
//  SettingsView.swift
//  TestesSwiftUI
//
//  Created by Moacir Ezequiel Lamego on 2023.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("notificationsEnabled") private var notificationsEnabled = true
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Notificações")) {
                    Toggle("Ativar Notificações", isOn: $notificationsEnabled)
                }

                Section(header: Text("Aparência")) {
                    Toggle("Modo Escuro", isOn: $darkModeEnabled)
                }
            }
            .navigationBarTitle("Configurações")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
