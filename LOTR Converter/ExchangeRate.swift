//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by Sean Greene on 8/22/23.
//

import SwiftUI

struct ExchangeRate: View {
    
    @State var leftImage: String
    @State var rightImage: String
    @State var text: String
    
    var body: some View {
        HStack{
            //gold
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
                
            // descrip
            Text(text)
        
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: "goldpenny", rightImage: "1 Gold Penny = 4 Silver Pieces", text: "silverpiece")
        .previewLayout(.sizeThatFits)
}
