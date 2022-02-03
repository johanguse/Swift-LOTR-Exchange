//
//  ExchangeRate.swift
//  LORT Convert
//
//  Created by Johan Guse on 16/01/22.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImg: String
    @State var textMid: String
    @State var rightImg: String
    
    var body: some View {
        HStack {
            //Left Image
            Image(leftImg)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            //Text
            Text(textMid)

            //Right Image
            Image(rightImg)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImg: "goldpiece", textMid: "1 Gold Piece = 4 Gold Pennies", rightImg: "goldpenny")
            .previewLayout(.sizeThatFits)
    }
}
