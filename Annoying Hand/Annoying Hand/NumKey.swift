//
//  NumKey.swift
//  Annoying Hand
//
//  Created by Tianxu Zhou on 2020/2/26.
//  Copyright © 2020 Tianxu Zhou. All rights reserved.
//

import SwiftUI

struct NumKey: View {
    @Binding var tapNum : Int
    @Binding var tapCounter : Int

    //var keyPos :CGPoint
    var num : Int
    //@State var touchNum : Int
    
    var body: some View {
        ZStack{
                   Rectangle()
                       .fill(Color.gray)
                       .frame(width:80,height: 53)
                       .cornerRadius(10)
                    

                   
            Text("\(self.num)")
                   .font(.system(size: 35))
                   .bold()
                       .foregroundColor(Color.white)
        }.onTapGesture {
            self.tapNum=self.num
            self.tapCounter+=1
           
        }
    }
}

struct NumKey_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            NumKey(tapNum:.constant(0),tapCounter: .constant(0),num: 1)
            
        }
    }
}
