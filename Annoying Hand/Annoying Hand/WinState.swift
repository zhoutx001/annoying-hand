//
//  WinState.swift
//  Annoying Hand
//
//  Created by Tianxu Zhou on 2020/2/27.
//  Copyright © 2020 Tianxu Zhou. All rights reserved.
//

import SwiftUI

struct WinState: View {
    @Binding var tapNum : Int
    @Binding var tapCounter : Int
    
    @Binding var pinNum : [Int]
    @Binding var isWin : Int
    @Binding var confirmInput : Bool
    
    //var digitIndex=0
    func isEqual()->Bool{
        if self.tapCounter==1{
            if self.tapNum==self.pinNum[0]{
                           self.isWin+=1
                 
            }
 
        }
        
        if self.tapCounter==2{
            if self.tapNum==self.pinNum[1]{
                            self.isWin+=1
    
            }

        }
        
        if self.tapCounter==3{
            if self.tapNum==self.pinNum[2]{
                    self.isWin+=1

            }
        
        }
        
        if self.tapCounter==4{
            if self.tapNum==self.pinNum[3]{
                 self.isWin+=1
                return true
            }
           
        }
         return false
        
    }
    
    var body: some View {
        ZStack{
            
            if isEqual() && self.confirmInput{
                VStack{
                    HStack{
                        Text("Do you want your receipt?")
                            .font(.system(size: 27))
                        .foregroundColor(Color.gray)
                            .bold()
                    }
                    Spacer()
                    
                }.offset(x:42,y:50)
            }
        }
        
        
    }
}

struct WinState_Previews: PreviewProvider {
    static var previews: some View {
        WinState(tapNum: .constant(0), tapCounter: .constant(0), pinNum: .constant([0,0,0,0]),isWin: .constant(0),confirmInput: .constant(false))
    }
}
