//
//  NewContentView.swift
//  DiceApp
//
//  Created by Илья Филяев on 28.08.2023.
//

import SwiftUI
import RealityKit

struct Polyhedron3DView: View {
    let sides: Int

    var body: some View {
        ZStack {
            ARViewContainer(sides: sides)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    let sides: Int

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        let mesh = MeshResource.generateBox(size: 1)
        let material = SimpleMaterial(color: .blue, isMetallic: true)

        for i in 0..<sides {
            let angle = Float(i) * (2 * .pi / Float(sides))

            let rotation = simd_quatf(angle: angle, axis: [0, 1, 0])
            let transform = Transform(rotation: rotation, translation: [0, 0, -2]) // Adjust translation as needed

            let modelEntity = ModelEntity(mesh: mesh, materials: [material])
            modelEntity.transform = transform

            arView.scene.addAnchor(modelEntity)
        }

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        // Update the view if needed
    }
}

struct ContentView: View {
    var body: some View {
        Polyhedron3DView(sides: 15) // Change the number of sides here
    }
}
