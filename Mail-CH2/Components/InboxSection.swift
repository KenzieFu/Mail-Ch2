//
//  InboxSection.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 20/04/26.
//

import SwiftUI

struct InboxSection: View {
    var title:String
    @State var mails:[Mail]
    var icon:String
    var body: some View {
            VStack(){
                HStack{
                    Image(systemName: icon)
                    Text(title).font(Font.headline.bold())
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.horizontal, 15)
                VStack{
                    ForEach(Array($mails[0..<3])) { $mail in
                        MailRow(femail: $mail, allMails: mails,currentIndex: 1)
                    }
                }
            }.padding(.top,20)
    }
}

#Preview {
    InboxSection(title:"Important", mails: [],icon: "")
}
