//
//  Navbar.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 17/04/26.
//

import SwiftUI

struct Navbar: View {
    var body: some View {
        NavigationStack{
           HStack{
                
           }.toolbar{
                    
                    ToolbarItem(placement:.principal){
                        Text("Hi, Kenzie").font(.system(size: 20, weight: .bold, design: .default))
                    }
                    
                    ToolbarItem{
                        Button{
                            print("tapped")
                        } label:{
                            Image(systemName: "ellipsis")
                        }
                    }
                }
        }
    }
}

#Preview {
    Navbar()
}
