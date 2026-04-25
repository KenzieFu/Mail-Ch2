//
//  RecentList.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 18/04/26.
//

import SwiftUI

struct RecentList: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Recent").font(Font.headline.bold())
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:15){
                    ForEach(colors) { color in
                        RecentItems(color: color)
                    }
                }.padding(.bottom, 10).padding(.top,10)
            }.frame(height: 120)
        }
    }
}

#Preview {
    RecentList()
}
