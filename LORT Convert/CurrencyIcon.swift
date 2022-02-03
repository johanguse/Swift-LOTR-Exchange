//
//  CurrencyIcon.swift
//  LORT Convert
//
//  Created by Johan Guse on 30/01/22.
//

import SwiftUI

struct CurrencyIcon: View {
    @State var currencyIcon: String
    @State var currencyText: String
    
    var body: some View {
        ZStack {
            Image(currencyIcon)
                .resizable()
                .scaledToFit()
            
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

struct CurrencyIcon_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyIcon(currencyIcon: "goldpenny", currencyText: "Gold Penny")
            .previewLayout(.sizeThatFits)
    }
}
