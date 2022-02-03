//
//  ContentView.swift
//  LORT Convert
//
//  Created by Johan Guse on 16/01/22.
//

import SwiftUI

struct ContentView: View {
    @State var leftVal = ""
    @State var rightVal = ""
    
    @State var rightAmountTemp = ""
    @State var leftAmountTemp = ""
    
    @State var leftType = false
    @State var rightType = false
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @State var showSelectCurrency = false
    
    var body: some View {
        ZStack {
            //Background Image
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //Pony Image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 280)
                
                //Currency Text
                Text("Current Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                
                //Currency Convertion Section
                HStack {
                    //Left
                    VStack {
                        
                        HStack {
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        
                        //Text Field
                        TextField("Amount", text: $leftVal, onEditingChanged: { type in
                            leftType = type
                            leftAmountTemp = leftVal
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftType ? leftVal : leftAmountTemp) { _ in
                                rightVal = leftCurrency.convert(amountString: leftVal, to: rightCurrency)
                            }
                            .onChange(of: leftCurrency) { _ in
                                leftVal = rightCurrency.convert(amountString: rightVal, to: leftCurrency)
                            }
                    }
                    
                    //Equal
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    //Right
                    VStack {
                        
                        HStack {
                            
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        
                        //Text Field
                        TextField("Amount", text: $rightVal, onEditingChanged: { type in
                            rightType = type
                            rightAmountTemp = rightVal
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.leading)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightType ? rightVal : rightAmountTemp) { _ in
                                leftVal = rightCurrency.convert(amountString: rightVal, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency) { _ in
                                rightVal = leftCurrency.convert(amountString: leftVal, to: rightCurrency)
                            }
                    }
                }
                .padding()
                .background(.black.opacity(0.6))
                .cornerRadius(50)
                
                Spacer()
                
                //Done Button
                Button ("Choose Currency"){
                    showSelectCurrency.toggle()
                }
                .font(.body)
                .padding(10.0)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
                .sheet(isPresented: $showSelectCurrency) {
                    SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                }
                
                Spacer()

                
                //Info Button
                HStack {
                    Spacer()
                    
                    Button {
                    //TODO ADD NEW SCREEN
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                }
                
            }
            .padding(.top, 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
