//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Sean Greene on 8/22/23.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency //binds this variable to the value of the leftCurrency var in ContentView
    @Binding var rightCurrency: Currency //binds this variable to the value of the rightCurrency var in ContentView
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        ZStack{
            //background image
            Image(.parchment)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            VStack{
                //text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                //currency grid
                CurrencyGrid(gridLayout: .constant(gridLayout), currency: $leftCurrency)
               
                
                //text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                //currencies
                HStack{
                    //currency icon
                    CurrencyGrid(gridLayout: .constant(gridLayout), currency: $rightCurrency)
                }
                
                //done
                Button("Done"){
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
            }

        }
    }
}

#Preview {
    SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
}
