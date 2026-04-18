//
//  RecentList.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 18/04/26.
//

import SwiftUI

struct RecentList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true){
            LazyHStack(spacing:20){
                        RecentItems()
                        RecentItems()
                        RecentItems()
                        RecentItems()
            }
        }
       
    }
}

#Preview {
    RecentList()
}
