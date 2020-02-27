//
//  ScreenView.swift
//  Annoying Hand
//
//  Created by Tianxu Zhou on 2020/2/26.
//  Copyright © 2020 Tianxu Zhou. All rights reserved.
//

import SwiftUI

struct ScreenView: View {
    
    @Binding var tapNum : Int
    @Binding var isStart : Bool
    @Binding var tapCounter : Int
    
    var body: some View {
//        ForEach(0..<self.tapNum)
        ZStack{
            if self.isStart{
                if self.tapCounter==1{
                    Text("*").font(.system(size: 55))
                }
               if self.tapCounter==2{
                   Text("* *").font(.system(size: 55))
               }
                if self.tapCounter==3{
                    Text("* * *").font(.system(size: 55))
                }
                if self.tapCounter==4{
                    Text("* * * *").font(.system(size: 55))
                }
                 
                
                
            }else{
                 Text(" ").font(.system(size: 35))
            }
        }

      
    }
}

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenView(tapNum: .constant(0),isStart: .constant(false),tapCounter: .constant(0))
    }
}
