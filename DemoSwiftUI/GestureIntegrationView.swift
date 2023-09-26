//
//  GestureIntegrationView.swift
//  TestesSwiftUI
//
//  Created by Moacir Ezequiel Lamego on 2023.
//

import SwiftUI

struct GestureIntegrationView: View {
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Angle = .degrees(0)
    @State private var translation: CGSize = .zero

    var body: some View {
        VStack {
            Spacer()

            Image(systemName: "photo")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(.blue)
                .scaleEffect(scale)
                .rotationEffect(rotation)
                .offset(translation)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            scale = value
                        }
                        .onEnded { _ in
                            // Limpar a escala após o gesto de zoom
                            scale = 1.0
                        }
                )
                .gesture(
                    RotationGesture()
                        .onChanged { value in
                            rotation = value
                        }
                        .onEnded { _ in
                            // Limpar a rotação após o gesto de rotação
                            rotation = .degrees(0)
                        }
                )
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            translation = value.translation
                        }
                        .onEnded { _ in
                            // Limpar a tradução após o gesto de arrasto
                            translation = .zero
                        }
                )

            Spacer()
        }
        .navigationBarTitle("Integração de Gestos")
    }
}

struct GestureIntegrationView_Previews: PreviewProvider {
    static var previews: some View {
        GestureIntegrationView()
    }
}
