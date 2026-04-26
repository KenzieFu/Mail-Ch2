//
//  SwipeCard.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 21/04/26.
//

import SwiftUI

struct SwipeCard: View {
    var mail:Mail
    enum CardAction {
        case archive,trash,none
    }
    var body: some View {
      
                VStack(alignment:.center,spacing: 0){
                  
                    Text(mail.subject) .multilineTextAlignment(.center).padding(20).font(.system(size:15, weight: .bold))
                    
                    VStack(alignment:.center){
                        Text(mail.sender) .font(.largeTitle).fontWeight(.bold)
//                        Text("@KenzieFu has invited you to collaborate on the KenzieFu/Ch-2-Ken-Dori-There repository").multilineTextAlignment(.center)
//                            .font(.system(size:12, weight: .regular))
                    }
                    Divider().padding(.top,30)
                    
                    Text(mail.summary).lineLimit(8).multilineTextAlignment(.leading)
                        .font(.system(size:12, weight: .regular)).padding(.vertical,20)
                    Divider().padding(.vertical,10)
                    
                    RecentItems(mail:mail,color:colors[randomIndex(count: colors.count)]).scaleEffect(0.9)
                    
                }.padding(.horizontal,40).padding(.bottom,30).padding(.top,20).background(Color(hex: "#FAFAFA")) .clipShape(RoundedRectangle(cornerRadius:50)).padding(20)
           
        }
    
}

#Preview {
    SwipeCard(mail:mail1)
}
