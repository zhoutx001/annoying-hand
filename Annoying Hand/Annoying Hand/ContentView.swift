//
//  ContentView.swift
//  Annoying Hand
//
//  Created by Tianxu Zhou on 2020/2/26.
//  Copyright © 2020 Tianxu Zhou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var pinNum = [Int.random(in: 1..<5),Int.random(in: 1..<5),Int.random(in: 1..<5),Int.random(in: 1..<5)]
    @State var cardPosition = CGPoint(x: 207, y: 1000)
    @State var tapNum = 0
    @State var tapCounter = 0
    @State var isStart = false
    @State var isWin=0
    @State var confirmInput=false
    
    
    
    var body: some View {
        
        GeometryReader{ geometry in
            ZStack{
                
                VStack{
                    CardView(cardPosition: self.$cardPosition, isStart: self.$isStart)
                }
                
                GameBoard(pinNum: self.$pinNum, tapNum: self.$tapNum, isStart: self.$isStart, tapCounter: self.$tapCounter, confirmInput:self.$confirmInput)
                
                
            }
            WinState(tapNum: self.$tapNum, tapCounter: self.$tapCounter, pinNum: self.$pinNum, isWin:self.$isWin,confirmInput:self.$confirmInput)
                
                .onAppear() {
                    // Initialize position to center of the screen.
                    self.cardPosition = CGPoint(x: geometry.size.width / 2, y: 835)
                    
            }
            
        }
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
