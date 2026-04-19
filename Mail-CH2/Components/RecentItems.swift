//
//  RecentItems.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 18/04/26.
//

import SwiftUI

struct RecentItems: View {
    var color: ColorsRecentItem
    var body: some View {
            VStack{
                ZStack{
                    Circle().frame(width: 73).foregroundColor(Color(hex:color.background))
                    Text("K").font(.system(size: 34, weight: .bold)).foregroundStyle(Color(hex:color.text))
                }
                Text("kenziefu").font(.system(size:13))
            }
    }
}

#Preview {
    RecentItems(color: colors[1] )
}
