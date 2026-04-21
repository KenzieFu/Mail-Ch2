//
//  SwipeCard.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 20/04/26.
//

import SwiftUI

struct SwipeCard: View {
    var body: some View {
        VStack{
            VStack(alignment:.center){
                Text("KenzieFu invited you to KenzieFu/ch-2-mail") .multilineTextAlignment(.center)
                Spacer()
                Text("Github") .font(.largeTitle).fontWeight(.bold)
            }.padding(.horizontal,80).padding(.bottom,30).padding(.top,20).background(Color(hex: "#FAFAFA")) .clipShape(RoundedRectangle(cornerRadius:50)).padding(30)
            
           
        }
        .frame(maxWidth:.infinity, maxHeight:.infinity).background(Color(hex:"#727272"))
    }
}

#Preview {
    SwipeCard()
}
