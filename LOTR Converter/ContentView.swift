//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Sean Greene on 8/21/23.
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency: Currency = .silverPiece
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTyping = false
    @State var rightTyping = false
    @State var rightCurrency: Currency = .goldPiece
    @State var showSelectCurrency: Bool = false
    @State var showExchangeInfo = false
    
    var body: some View {
        ZStack {
            //Background image
            Image(.background)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //Prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                //curency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                //currency conversion section
                HStack {
                    //left conversion
                    VStack{
                        //currency
                        HStack{
                            //currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency, content: {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        })
                        //textfield
                        TextField("Amount",text: $leftAmount, onEditingChanged: {
                            changed in
                            leftTyping = changed
                            leftAmountTemp = leftAmount
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .onChange(of: leftTyping ? leftAmount : leftAmountTemp) { (oldAmount, newAmount) in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                            .onChange(of: leftCurrency){ _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                        
                    }
                    //equal
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    
                    //right conversion
                    VStack{
                        //currency
                        HStack{
                            //currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            //currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency, content: {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        })
                        
                        //textfield
                        TextField("Amount",text: $rightAmount, onEditingChanged: {
                            typing in
                            rightTyping = typing
                            rightAmountTemp = rightAmount
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTyping ? rightAmount : rightAmountTemp) { (oldValue, newValue) in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency){ _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                                
                            }

                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                
                Spacer()
                
                //info button
                HStack {
                    Spacer()
                    Button {
                        //Display exchange info screen
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                        
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo, content: {
                        ExchangeInfo()
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

