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
                           
                           Spacer()
            Button{
            }label:{
                Image(systemName: "ellipsis")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                    .padding(20)
                    .background(Circle().fill(Color.white.opacity(0.1))).shadow(radius: 30)
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
            
            }
                          
    }
}

#Preview {
    Navbar()
}
