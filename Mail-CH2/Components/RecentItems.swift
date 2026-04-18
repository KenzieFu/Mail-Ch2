//
//  RecentItems.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 18/04/26.
//

import SwiftUI

struct RecentItems: View {
    var body: some View {
        HStack{
            VStack{
                ZStack{
                    Circle().frame(width: 73).foregroundColor(.blue)
                    Text("K").font(.system(size: 34, weight: .bold))
                }
                Text("kenziefu").font(.system(size:13))
            }
        }
    }
}

#Preview {
    RecentItems()
}
