//
//  KeyBoard.swift
//  Annoying Hand
//
//  Created by Tianxu Zhou on 2020/2/26.
//  Copyright © 2020 Tianxu Zhou. All rights reserved.
//

import SwiftUI

struct KeyBoard: View {
    @Binding var tapNum : Int
@Binding var tapCounter : Int
    var body: some View {

        
             VStack{
               
                ForEach(0..<3){
                    rowIndex in
                    HStack{
                        ForEach(0..<3){
                            colIndex in
                            
                            NumKey(tapNum:self.$tapNum,tapCounter:self.$tapCounter, num: 3*rowIndex+colIndex+1)
                            
                            
                        }
                    }

                }

        }.padding(80)
        
    }
}

struct KeyBoard_Previews: PreviewProvider {
    static var previews: some View {
        KeyBoard(tapNum:.constant(0),tapCounter: .constant(0))
    }
}
