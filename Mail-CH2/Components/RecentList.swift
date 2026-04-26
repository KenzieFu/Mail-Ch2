//
//  RecentList.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 18/04/26.
//

import SwiftUI

struct RecentList: View {
    let mails: [Mail]
    var body: some View {
        VStack(alignment:.leading){
            Text("Recent").font(Font.headline.bold())
            ScrollView(.horizontal, showsIndicators: true){
                LazyHStack(spacing:15){
                    ForEach(Array(mails.enumerated()), id: \.element.id) { index, mail in
                        NavigationLink(destination:DetailScreenView(femail:mail,allMails: mails,currentIndex: index)){
                            RecentItems(mail:mail,color: colors[randomize(current: index, divider: colors.count)])
                        }.buttonStyle(.plain)
                    }
                }.padding(.bottom, 10).padding(.top,10)
           
            }.frame(maxWidth:.infinity)
        }
    }
}

#Preview {
    RecentList(mails: [])
}
