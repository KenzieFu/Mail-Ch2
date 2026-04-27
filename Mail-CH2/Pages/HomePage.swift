//
//  ContentView.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 17/04/26.
//

import SwiftUI

struct HomePage: View {
    @Environment(MailStore.self) var mailStore
    var body: some View {
        ScrollView{
            VStack(spacing:-19){
                RecentList(mails:mailStore.recentMail()) 
                    .padding(.leading, 23)
                NavigationLink(destination:Inbox()){
                    InboxSection(title:"Important",mails:mailStore.filterImportanMail(), icon:"bookmark")
                }
                .foregroundStyle(Color(.black))
                .padding(.bottom, 24)
                .padding(.horizontal,24)
                
                NavigationLink(destination:Inbox()){
                    InboxSection(title:"Frequent",mails:mailStore.frequentMail(),icon:"clock.arrow.trianglehead.counterclockwise.rotate.90")
                }
                .foregroundStyle(Color(.black))
                .padding(.horizontal,24)
            }
        }
    }
}

#Preview {
    HomePage().environment(MailStore())
}
