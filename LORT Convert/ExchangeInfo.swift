//
//  ExchangeInfo.swift
//  LORT Convert
//
//  Created by Johan Guse on 16/01/22.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //Background
        ZStack {
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack {
                Text("Exchange Info")
                    .font(.largeTitle)
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                //Rates
                ExchangeRate(leftImg: "goldpiece", textMid: "1 Gold Piece = 4 Gold Pennies", rightImg: "goldpenny")
                
                ExchangeRate(leftImg: "goldpenny", textMid: "1 Gold Penny = 4 Silver Pieces", rightImg: "silverpiece")
                
                ExchangeRate(leftImg: "silverpiece", textMid: "1 Silver Piece = 4 Silver Pennies", rightImg: "silverpenny")
                
                ExchangeRate(leftImg: "silverpiece", textMid: "1 Silver Piece = 100 Cooper Pennies", rightImg: "copperpenny")
                
                Spacer()
                
                //Done Button
                Button ("Done"){
                    dismiss()
                }
                .font(.body)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
                
                Spacer()
                
            }
            .foregroundColor(.black)
        }
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
            .preferredColorScheme(.dark)
    }
}
