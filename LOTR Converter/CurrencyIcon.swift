//
//  CurrencyIcon.swift
//  LOTR Converter
//
//  Created by Sean Greene on 8/22/23.
//

import SwiftUI

struct CurrencyIcon: View {
    
    @State var currencyImage: String
    @State var currencyText: String
    
    var body: some View {
        ZStack{
            //currency image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            //currency text
            VStack {
                Spacer()
                Text(currencyText)
                    .padding(3)
                    .font(.caption)
                .background(.brown.opacity(0.75))
            }
    
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .cornerRadius(25)
    }
}

#Preview {
    CurrencyIcon(currencyImage: "goldpenny", currencyText: "Gold Penny")
        .previewLayout(.sizeThatFits)
}
