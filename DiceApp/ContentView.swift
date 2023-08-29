//
//  ContentView.swift
//  DiceApp
//
//  Created by Илья Филяев on 28.08.2023.
//

//import SwiftUI
//import ModelIO
//import SceneKit
//
//struct ContentView: View {
//    var body: some View {
//        My3DShapeView()
//            .frame(width: 300, height: 300)
//    }
//}
//
//struct My3DShapeView: UIViewRepresentable {
//    func makeUIView(context: Context) -> SCNView {
//        let sceneView = SCNView()
//        sceneView.scene = SCNScene()
//
//        // Generate n-sided geometry using ModelIO
//        let nSidedGeometry = generateNSidedGeometry(sides: 8) // Replace with the desired number of sides
//        let nSidedNode = SCNNode(geometry: nSidedGeometry)
//        sceneView.scene?.rootNode.addChildNode(nSidedNode)
//
//        // Create camera and add to the scene
//        let camera = SCNCamera()
//        let cameraNode = SCNNode()
//        cameraNode.camera = camera
//        cameraNode.position = SCNVector3(x: 0, y: 0, z: 3)
//        sceneView.scene?.rootNode.addChildNode(cameraNode)
//
//        // Set the scene view properties
//        sceneView.backgroundColor = UIColor.black
//        sceneView.allowsCameraControl = true
//
//        return sceneView
//    }
//
//    func updateUIView(_ uiView: SCNView, context: Context) {
//        // Update the view if needed
//    }
//
//    func generateNSidedGeometry(sides: Int) -> SCNGeometry {
//            let radius: Float = 1.0
//            let vertices = (0..<sides).map { index -> SCNVector3 in
//                let angle = Float(index) * 2.0 * Float.pi / Float(sides)
//                let x = radius * cosf(angle)
//                let y = radius * sinf(angle)
//                return SCNVector3(x, y, 0)
//            }
//
//            let indices: [UInt16] = (1..<sides-1).flatMap { index in
//                [0, UInt16(index), UInt16(index + 1)]
//            }
//
//            let vertexSource = SCNGeometrySource(vertices: vertices)
//            let indexData = Data(bytes: indices, count: indices.count * MemoryLayout<UInt16>.size)
//            let indexElement = SCNGeometryElement(data: indexData, primitiveType: .triangles, primitiveCount: indices.count / 3, bytesPerIndex: MemoryLayout<UInt16>.size)
//
//            return SCNGeometry(sources: [vertexSource], elements: [indexElement])
//        }
//}
