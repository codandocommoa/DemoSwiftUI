//
//  ThemeCustomizationApp.swift
//  TestesSwiftUI
//
//  Created by Moacir Ezequiel Lamego on 2023.
//

import SwiftUI

struct ThemeCustomizationView: View {
    @State var isDarkModeEnabled: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Personalização Temática")
                    .font(.largeTitle)
                    .padding()
                
                Button(action: {
                    isDarkModeEnabled.toggle()
                }) {
                    Text("Alternar Tema")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationBarTitle("Tema Personalizado")
        }
        .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
    }
    
}

struct ThemeCustomizationApp_Previews: PreviewProvider {
    static var previews: some View {
        ThemeCustomizationView()
    }
}
