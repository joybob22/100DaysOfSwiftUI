//
//  TransitionViews.swift
//  Animations
//
//  Created by Brayden Lemke on 1/3/22.
//

import SwiftUI

struct TransitionViews: View {
    @State private var isShowingRed = false
    var body: some View {
        VStack {
           Button("Tap Me") {
               withAnimation {
                   isShowingRed.toggle()
               }
           }
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
       }
    }
}

struct TransitionViews_Previews: PreviewProvider {
    static var previews: some View {
        TransitionViews()
    }
}


struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}
