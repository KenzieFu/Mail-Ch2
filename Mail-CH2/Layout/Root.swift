
//
//  ContentView.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 17/04/26.
//

import SwiftUI

struct Root: View {
    var body: some View {
     
        NavigationStack{
            Navbar().padding(.horizontal,24)
            HomePage()
            }
        }
    }

#Preview {
    Root()
}
