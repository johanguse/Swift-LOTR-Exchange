//
//  SelectCurrency.swift
//  LORT Convert
//
//  Created by Johan Guse on 30/01/22.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack {
                
                Spacer()
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                //Currency Icons
                IconGrid(currency: $leftCurrency)
                
                
                //Text
                Text("Select the currency to convert:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                //Currency Icons
                IconGrid(currency: $rightCurrency)

                Spacer()
                
                //Done Button
                Button ("Done"){
                    dismiss()
                }
                .font(.body)
                .padding(10.0)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
                
                Spacer()

            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
    }
}
