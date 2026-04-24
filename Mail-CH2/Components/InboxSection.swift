//
//  InboxSection.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 20/04/26.
//

import SwiftUI

struct InboxSection: View {
    var title:String
    var mails:[Mail]
    var icon:String
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Image(systemName: icon)
                Text(title).font(Font.headline.bold())
                
            }
            LazyVStack{
                ForEach(Array(mails.prefix(3))) { mail in
                    MailRow(femail: mail, allMails: mails,currentIndex: 1)
                }
            }
           
                
        }.frame(maxWidth: .infinity, alignment: .leading).padding(.top,20)
       
    }
}

#Preview {
    InboxSection(title:"Important", mails: [],icon: "")
}
