//
//  CustomButton.swift
//  TestesSwiftUI
//
//  Created by Moacir Ezequiel Lamego on 26/09/23.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

struct ContentCustomButtonView: View {
    var body: some View {
        VStack {
            Text("Reutilização de Componentes")
                .font(.largeTitle)
                .padding()

            CustomButton(title: "Botão na Tela Principal") {
                // Ação ao pressionar o botão na tela principal
                print("Botão na Tela Principal pressionado")
            }
            .padding()

            CustomButton(title: "Botão em Outra Tela") {
                // Ação ao pressionar o botão em outra tela
                print("Botão em Outra Tela pressionado")
            }
            .padding()
        }
        .navigationBarTitle("Exemplo de Reutilização de Componentes")
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentCustomButtonView()
    }
}
