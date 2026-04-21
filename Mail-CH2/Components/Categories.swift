//
//  Categories.swift
//  Mail-CH2
//
//  Created by Michelle Aldorino on 18/04/26.
//

import SwiftUI

struct Categories: View {
    
    @Binding var selectedIndex: Int
    let categories = [
        ("tray.fill", "All Mail", Color.blue),
        ("envelope.fill", "Unread", Color.yellow),
        ("envelope.open.fill", "Read", Color.green)
    ]
    
    var body: some View {
        //        ScrollView(.horizontal) {
        HStack(spacing: 10) {
            ForEach(categories.indices, id: \.self) { index in
                Button {
                    selectedIndex = index
                } label : {
                    HStack(spacing: 6) {
                        Image(systemName: categories[index].0)
                        
                        if selectedIndex == index {
                            Text(categories[index].1)
                        }
                    }
                    .fontWeight(
                        selectedIndex == index ? .semibold : .regular
                    )
                    .padding(.horizontal,
                             selectedIndex == index ? 62 : 18)
                    .padding(.vertical, 12)
                    .background(
                        selectedIndex == index ? categories[index].2 : Color.gray.opacity(0.4)
                    )
                    .foregroundColor(
                        selectedIndex == index ? (index == 4 ? .black : .white) : .gray
                    )
                    .clipShape(Capsule())
                }
            }
        }
        //        }
        .padding(.horizontal)
    }
}


#Preview {
    Categories(selectedIndex: .constant(0))
}
