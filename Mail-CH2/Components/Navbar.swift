//
//  Navbar.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 20/04/26.
//

import SwiftUI

struct Navbar: View {
    var body: some View {
        HStack {
                           Text("Hi, Kenzie")
                .font(.system(size: 30, weight: .bold)).foregroundColor(Color(hex:"AEAEB2"))
                           
                           Spacer() // This creates the empty space in the middle
                           
                           // Just the icon/text, no Button wrapper
                           Image(systemName: "ellipsis")
                               .font(.system(size: 20, weight: .bold))
                               .padding(8)
                               .background(Circle().fill(Color.gray.opacity(0.1)))
                       }

                       .padding(.top, 10)
                       .padding(.bottom, 20)
    }
}

#Preview {
    Navbar()
}
