//
//  RecentItems.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 18/04/26.
//

import SwiftUI

struct RecentItems: View {
    var mail: Mail
    var color: ColorsRecentItem
    
    var body: some View {
        let firstLetter = String(mail.sender.first ?? "?").uppercased()
            VStack{
                ZStack{
                    Circle().frame(width: 73).foregroundColor(Color(hex:color.background))
                    Text(firstLetter).font(.system(size: 34, weight: .bold)).foregroundStyle(Color(hex:color.text))
                }
                Text(mail.sender).font(.system(size:13))
            }
            .padding(.bottom, 16)
        }
    }


#Preview {
    RecentItems(mail:mails[0],color: colors[1] )
}
