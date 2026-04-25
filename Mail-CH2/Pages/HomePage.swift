//
//  ContentView.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 17/04/26.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(spacing:-19){
                    RecentList()
                        .padding(.leading, 23)
                    
                    NavigationLink(destination:Inbox()){
                        InboxSection(title:"Important",mails:mails, icon:"bookmark")
                    }
                    .foregroundStyle(Color(.black))
                    .padding(.bottom, 24)
                    
                    NavigationLink(destination:Inbox()){
                        InboxSection(title:"Frequent",mails:mails,icon:"clock.arrow.trianglehead.counterclockwise.rotate.90")
                    }
                    .foregroundStyle(Color(.black))
                }
            }
        }
    }
}
#Preview {
    HomePage()
}
