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
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    ForEach(Contacts) { contact in
                        VStack(spacing: 6) {
                            ZStack {
                                Circle()
                                    .fill(contact.bgColor)
                                    .frame(width: 68, height: 68)
                                Text(String(contact.name.prefix(1)).uppercased())
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(contact.textColor)
                            }
                            Text(contact.name)
                                .font(.system(size: 12))
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .padding(.bottom, 16)
        }
    }
}

#Preview {
    RecentItems(color: colors[1] )
}
