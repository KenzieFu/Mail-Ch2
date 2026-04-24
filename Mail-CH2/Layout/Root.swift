
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
            VStack(spacing:0){
                
                    Navbar().padding(.horizontal,24)
                
                    HomePage().padding(.top, -10).padding(.horizontal,24)
                    Spacer()
                
                
            }
//            .toolbar{
//                ToolbarItem(placement:.topBarLeading){
//                    Text("Hi, Kenzie").font(.system(size: 20, weight: .bold, design: .default))
//                }
//                ToolbarItem(placement: .principal) {
//                     Text("Just a test")
//                  }
//                  
//
//                ToolbarItem(placement:.topBarTrailing){
//                    Button{
//                        print("tapped")
//                    } label:{
//                        Image(systemName: "ellipsis")
//                    }
//                }
//            }.toolbarRole(.navigationStack)
        }
    }
}

#Preview {
    Root().environment(MailStore())
}
