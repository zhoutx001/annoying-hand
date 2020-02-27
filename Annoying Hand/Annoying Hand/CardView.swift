//
//  CardView.swift
//  Annoying Hand
//
//  Created by Tianxu Zhou on 2020/2/26.
//  Copyright © 2020 Tianxu Zhou. All rights reserved.
//

import SwiftUI

struct CardView: View {
   
  
    @Binding var cardPosition: CGPoint
    @Binding var isStart : Bool
    // A variable that keeps the current location before dragging starts.
    @State var offsetBeforeStartOfDrag = CGPoint()
    

    let cardImg="card"
    var body: some View {
        

        let drag = DragGesture(minimumDistance: 0.0, coordinateSpace: CoordinateSpace.global)
        .onChanged { gesture in
            // Update position on drag.
//            if self.offsetBeforeStartOfDrag.y + gesture.translation.height < 600 {
            func isCardInserted(){
                if self.offsetBeforeStartOfDrag.y + gesture.translation.height < 600{
                    return self.isStart=true
                }
            }
            isCardInserted()
            self.cardPosition = CGPoint(x: self.offsetBeforeStartOfDrag.x,
                                        y:  self.isStart ? 600: self.offsetBeforeStartOfDrag.y + gesture.translation.height)
           // }

        }
        .onEnded { gesture in
            // Remember offset when touch ended.
            
                 self.offsetBeforeStartOfDrag = self.cardPosition

            
           
        }
        
        
        return Image(cardImg)
            .position(self.cardPosition)
        .animation(.easeInOut(duration: 0.2))
        .gesture(drag)
        .onAppear() {
            // Initialize offset on appear.
            self.offsetBeforeStartOfDrag = self.cardPosition
        }
           
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            CardView(cardPosition: .constant(CGPoint(x: geometry.size.width / 2, y:835)),isStart: .constant(false))
        }
        
    }
}
