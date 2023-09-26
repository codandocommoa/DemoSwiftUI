//
//  ContentModalView.swift
//  TestesSwiftUI
//
//  Created by Moacir Ezequiel Lamego on 26/09/23.
//

import SwiftUI

struct ContentModalView: View {
    @State private var isModalPresented = false
    @State private var isDetailViewPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Tela Principal")
                    .font(.largeTitle)
                    .padding()
                
                Button("Abrir Modal") {
                    isModalPresented = true
                }
                .padding()
                .sheet(isPresented: $isModalPresented) {
                    ModalView(isPresented: $isModalPresented, isDetailViewPresented: $isDetailViewPresented)
                }
                
                NavigationLink(
                    destination: DetailView(isDetailViewPresented: $isDetailViewPresented),
                    isActive: $isDetailViewPresented
                ) {
                    EmptyView()
                }
                .hidden()
            }
            .navigationBarTitle("Uso de Modais e Navegação")
        }
    }
}

struct ModalView: View {
    @Binding var isPresented: Bool
    @Binding var isDetailViewPresented: Bool
    
    var body: some View {
        VStack {
            Text("Modal")
                .font(.largeTitle)
                .padding()
            
            Button("Fechar Modal") {
                isPresented = false
            }
            .padding()
            
            Button("Ir para a Segunda Tela") {
                isDetailViewPresented = true
                isPresented = false
            }
            .padding()
        }
    }
}

struct DetailView: View {
    @Binding var isDetailViewPresented: Bool
    
    var body: some View {
        VStack {
            Text("Segunda Tela")
                .font(.largeTitle)
                .padding()
            
            Button("Voltar para a Tela Principal") {
                isDetailViewPresented = false
            }
            .padding()
        }
    }
}

struct ContentModalView_Previews: PreviewProvider {
    static var previews: some View {
        ContentModalView()
    }
}
