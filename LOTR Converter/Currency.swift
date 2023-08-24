//
//  Currency.swift
//  LOTR Converter
//
//  Created by Sean Greene on 8/23/23.
//

enum Currency: Double, CaseIterable {
    case copperPenny = 640
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case romanCoin = 8
    case goldPiece = 1
    
    func convert(amountString: String, to currency: Currency) -> String{
        guard let startAmount = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = startAmount / self.rawValue * currency.rawValue
        
        if convertedAmount > 0 {
            return String(format: "%.2f", convertedAmount)
        } else {
            return ""
        }
    }
}

enum CurrencyText: String, CaseIterable {
    case copperPenny = "Copper Penny"
    case silverPenny = "Silver Penny"
    case silverPiece = "Silver Piece"
    case goldPenny = "Gold Penny"
    case romanCoin = "Roman Coin"
    case goldPiece = "Gold Piece"
}

enum CurrencyImage: String, CaseIterable {
    case copperPenny = "copperpenny"
    case silverpenny = "silverpenny"
    case silverpiece = "silverpiece"
    case goldpenny = "goldpenny"
    case romancoin = "romanCoin-removebg-preview"
    case goldpiece = "goldpiece"
}
