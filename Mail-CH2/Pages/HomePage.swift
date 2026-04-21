//
//  ContentView.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 17/04/26.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        ScrollView{
            VStack{
                RecentList()
                InboxSection(title:"Important",mails:mails, icon:"bookmark")
                InboxSection(title:"Frequent",mails:mails,icon:"clock.arrow.trianglehead.counterclockwise.rotate.90")
            }
        }
        HStack{
            HStack{
                NavigationLink(destination:SwipeView()){
                    HStack{
                        Image(systemName: "rectangle.stack")
                        Text("Cards")
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,10)
                    
                    
                }.background(Color.blue).foregroundColor(Color.white).clipShape(Capsule())
                
                
            }
            Spacer()
            HStack(spacing:0){
                Button{
                }label:{
                    HStack{
                        Image(systemName: "magnifyingglass")
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,10)
                    
                    
                }.background(Color.white)   .foregroundColor(Color.black).clipShape(Circle())
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                Button{
                }label:{
                    HStack{
                        Image(systemName: "square.and.pencil")
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,10)
                    
                    
                }.background(Color.white).foregroundColor(Color.black).clipShape(Circle()).shadow(color: .gray, radius: 2, x: 0, y: 2)
                
            }
        }.background(Color.clear).frame(maxWidth:.infinity).padding(.horizontal,5)
    
    
    }
}

#Preview {
    HomePage()
}
