//
//  AnimationDemoView.swift
//  TestesSwiftUI
//
//  Created by Moacir Ezequiel Lamego on 2023.
//

import SwiftUI

struct AnimationDemoView: View {
    @State private var rectangleScale: CGFloat = 1.0
    @State private var rectanglePosition = CGPoint(x: 100, y: 100)
    @State private var rotationAngle: Double = 0.0

    var body: some View {
        VStack {
            Text("Toque e Arraste")
                .font(.headline)
                .padding()
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .scaleEffect(rectangleScale)
                    .position(rectanglePosition)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                rectanglePosition = value.location
                            }
                    )
                    .animation(.easeInOut(duration: 0.2))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    rectangleScale = rectangleScale == 1.0 ? 1.5 : 1.0
                }
            }) {
                Text("Redimensionar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    rotationAngle += 45
                }
            }) {
                Text("Rotacionar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .rotationEffect(.degrees(rotationAngle))
        }
        .navigationBarTitle("Animações e Transições")
    }
}

struct AnimationDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemoView()
    }
}
