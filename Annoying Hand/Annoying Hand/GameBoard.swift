//
//  GameBoard.swift
//  Annoying Hand
//
//  Created by Tianxu Zhou on 2020/2/27.
//  Copyright © 2020 Tianxu Zhou. All rights reserved.
//

import SwiftUI

struct GameBoard: View {
    let switchTimer=Timer.publish(every: 1.1, on: .main, in: .common).autoconnect()
    let switchTimerF=Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()
    let everyThreeSecs=Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    @State var isSwitchedSide=false
    @State var speedFast=false
    
    
    @Binding var pinNum : [Int]
    @Binding var tapNum : Int
    @Binding var isStart : Bool
    @Binding var tapCounter : Int
    @Binding var confirmInput : Bool
    
    let randomStartPosXL = -400
    let randomStartPosXR=600
    let randomStartPosY=Float.random(in: 150..<350)
    let posImg="posW"
    
    var body: some View {
        GeometryReader{
            geometry in
            ZStack{
                Image(self.posImg).offset(y:-40)
                ZStack{
                    VStack{
                        KeyBoard(tapNum: self.$tapNum,tapCounter:self.$tapCounter)
                        HStack{
                            Rectangle()
                                .fill(Color.init(red: 246/255, green: 67/255, blue: 75/255))
                                .frame(width:80,height: 53)
                                .cornerRadius(10)
                                .offset(x:0, y:-80)
                                .onTapGesture {
                                    self.isStart=false
                            }
                            Rectangle()
                                .fill(Color.gray.opacity(0.9))
                                //                                                                .fill(Color.init(red: 251/255, green: 194/255, blue: 66/255))
                                .frame(width:80,height: 53)
                                .cornerRadius(10)
                                .offset(x:0, y:-80)
                                .onTapGesture {
                                    //                                        self.isStart=false
                            }
                            Rectangle()
                                .fill(Color.init(red: 31/255, green: 187/255, blue: 112/255))
                                .frame(width:80,height: 53)
                                .cornerRadius(10)
                                .offset(x:0, y:-80)
                                .onTapGesture {
                                    self.confirmInput=true
                            }
                        }
                        
                    }
                    
                    if self.isStart{
                        MovingHand(isSwitchedSide: self.$isSwitchedSide
                            ,handPosOffset: CGPoint(x:CGFloat(self.isSwitchedSide ? self.randomStartPosXL : self.randomStartPosXR),y:CGFloat(self.randomStartPosY))).offset(x:0,y:-80)
                    }
                    
                    
                }.offset(y:40)
                VStack{
                    if !self.speedFast{
                        PasswordHint(pinNum:self.$pinNum,isStart: self.$isStart)
                    }
                    
                    Spacer()
                }.padding(40)
                
                VStack{
                    
                    ScreenView(tapNum: self.$tapNum,isStart: self.$isStart,tapCounter:self.$tapCounter)

                    Spacer()
                }.offset(y:200)
                .onReceive(self.switchTimer){ _ in
                    if !self.speedFast{
                        self.isSwitchedSide.toggle()
                    }
                    
                    
                }
                .onReceive(self.everyThreeSecs){ _ in
                    //            if self.opac>0
                    //                self.opac-=0.5
                    
                    if self.isStart{
                        self.speedFast=true
                    }else{
                        self.speedFast=false
                    }
                    
                }
                .onReceive(self.switchTimerF){ _ in
                    //            if self.opac>0
                    //                self.opac-=0.5
                    
                    if self.speedFast{
                        self.isSwitchedSide.toggle()
                    }
                    
                    
                }
                
                
                
                
                
            }
        }
        
    }
}

struct GameBoard_Previews: PreviewProvider {
    static var previews: some View {
        GameBoard(pinNum: .constant([0,0,0,0]),tapNum: . constant(0),isStart: .constant(false),tapCounter: .constant(0), confirmInput: .constant(false))
    }
}
