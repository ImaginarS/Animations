//
//  ContentView.swift
//  Animations
//
//  Created by Sandra Quel on 2/22/21.
//

import SwiftUI

//struct ContentView: View {
//    @State private var animationAmount = 0.0
//
//    var body: some View {
//        Button("Tap Me"){
//            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//                self.animationAmount += 360
//            }
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .rotation3DEffect(
//            .degrees(animationAmount),
//            axis: (x: 0.0, y: 1.0, z: 1.0),
//            anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
//            anchorZ: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/,
//            perspective: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/
//        )
//    }
//}

//struct ContentView: View {
//    @State private var enabled = false
//
//    var body: some View {
//        Button("Tap Me"){
//            self.enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled
//                        ? Color.pink : Color.orange)
//        .animation(nil)
//
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
//    }
//}
//
//struct ContentView: View {
//
//    @State private var dragAmount = CGSize.zero
//
//    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//             DragGesture()
//                .onChanged { self.dragAmount = $0.translation}
//                .onEnded { _ in
//                    withAnimation(.spring()) {
//                        self.dragAmount = .zero
//
//                    }
//
//                }
//            )
//    }
//}


struct ContentView: View {
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    let letters = Array("Hello SwiftUI")
    
    
    var body: some View {
        HStack(spacing:0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(num)/20))
            }
        }
        .gesture(
            DragGesture()
                    .onChanged {self.dragAmount = $0.translation }
                    .onEnded {_ in
                        self.dragAmount = . zero
                        self.enabled.toggle()
                    }
        )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
