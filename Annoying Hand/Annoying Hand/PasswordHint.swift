//
//  PasswordHint.swift
//  Annoying Hand
//
//  Created by Tianxu Zhou on 2020/2/26.
//  Copyright © 2020 Tianxu Zhou. All rights reserved.
//

import SwiftUI

struct PasswordHint: View {
    
    @Binding var pinNum : [Int]
    @Binding var isStart : Bool
    //@State var isShown=true
  
    
    var body: some View {
        ZStack{
            if self.isStart{
                 VStack{
                     Text("YOUR PIN")
                     .font(.system(size: 20))
                        .foregroundColor(Color.gray)
            
                      HStack{
                          ForEach(0..<4){
                              value in
                              Text("\(self.pinNum[value])")
                                  .font(.system(size: 40))
                                  .bold()
                                //.opacity(self.opac)
                          }
                     
                          
                      }
                 }

             }

        }


        
    }
}

struct PasswordHint_Previews: PreviewProvider {
    static var previews: some View {
        PasswordHint(pinNum: .constant([0,0,0,0]), isStart: .constant(false))
    }
}
