//
//  MovingHand.swift
//  Annoying Hand
//
//  Created by Tianxu Zhou on 2020/2/26.
//  Copyright © 2020 Tianxu Zhou. All rights reserved.
//

import SwiftUI

struct MovingHand: View {
    @Binding var isSwitchedSide : Bool
    var handPosOffset:CGPoint
//    let timerHand=Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var isHandShown=false
    let randomFloatX=Float.random(in: -30..<200)
    let randomFloatY=Float.random(in: 20..<100)
    
    var randomNum=0
    let handImg="arm"
    var body: some View {
        Image(handImg)
            .rotationEffect(.degrees(Double.random(in: 1..<360)))
            .offset(x:self.isSwitchedSide ? CGFloat(randomFloatX) : handPosOffset.x,y:self.isSwitchedSide ? CGFloat(randomFloatY) : handPosOffset.y)
       .animation(.easeInOut(duration: 0.2))
            
//        .onReceive(timerHand){ _ in
//        //            if self.opac>0
//        //                self.opac-=0.5
//
//            self.isHandShown=true
//
//                }
    }
}

struct MovingHand_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            MovingHand(isSwitchedSide:.constant(false),handPosOffset:CGPoint(x: 0, y:0))
        }

    
    }
}
