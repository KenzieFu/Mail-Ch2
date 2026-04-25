//
//  SwipeCard.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 21/04/26.
//

import SwiftUI

struct SwipeCard: View {
    enum CardAction {
        case archive,trash,none
    }
    var body: some View {
        let longText = "You can accept or decline this invitation. You can also head over to https://github.com/KenzieFu/Ch-2-Ken-Dori-There to check out the repository or visit @KenzieFu to learn a bit more about them. \n\n This invitation will expire in 7 days."
                VStack(alignment:.center,spacing: 0){
                  
                    Text("KenzieFu invited you to KenzieFu/ch-2-mail") .multilineTextAlignment(.center).padding(20).font(.system(size:15, weight: .bold))
                    
                    VStack(alignment:.center){
                        Text("Github") .font(.largeTitle).fontWeight(.bold)
                        Text("@KenzieFu has invited you to collaborate on the KenzieFu/Ch-2-Ken-Dori-There repository").multilineTextAlignment(.center)
                            .font(.system(size:12, weight: .regular))
                    }
                    Divider().padding(.top,30)
                    
                    Text(longText).lineLimit(8).multilineTextAlignment(.leading)
                        .font(.system(size:12, weight: .regular)).padding(.vertical,20)
                    Divider().padding(.vertical,10)
                    
                    RecentItems(mail:mails[0],color: colors[0]).scaleEffect(0.9)
                    
                }.padding(.horizontal,40).padding(.bottom,30).padding(.top,20).background(Color(hex: "#FAFAFA")) .clipShape(RoundedRectangle(cornerRadius:50)).padding(20)
           
        }
    
}

#Preview {
    SwipeCard()
}
