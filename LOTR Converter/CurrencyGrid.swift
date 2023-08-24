//
//  CurrencyGrid.swift
//  LOTR Converter
//
//  Created by Sean Greene on 8/23/23.
//

import SwiftUI

struct CurrencyGrid: View {
    
    @Binding var gridLayout: [GridItem]
    @Binding var currency: Currency
    
    func saveCurrencyToUserDefaults(currency: Currency) {
        UserDefaults.standard.setValue(currency.rawValue, forKey: "savedCurrency")
    }

    var body: some View {
        LazyVGrid(columns: gridLayout){
            ForEach(0..<6){ i in
                if Currency.allCases[i] == currency{
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25.0)
                            .stroke(lineWidth: 3)
                            .opacity(0.5))
                        .shadow(color: .black, radius: 9)
                }else {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                        .onTapGesture {
                            currency = Currency.allCases[i]
                            saveCurrencyToUserDefaults(currency: currency)
                        }
                }
            }
        }
        .padding([.bottom, .leading, .trailing])
    }
}

#Preview {
    CurrencyGrid(gridLayout: .constant([GridItem(), GridItem(), GridItem()]), currency: .constant(.goldPenny))
}
