//
//  Navbar.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 20/04/26.
//

import SwiftUI

struct Navbar: View {
    
    @State private var showSheet = false
    var body: some View {
        NavigationStack{
            HStack {
                Text("Hi, Kenzie")
                    .font(.system(size: 30, weight: .bold)).foregroundColor(Color(hex:"AEAEB2"))
                    .padding(.top, 11)
                Spacer()
                Menu {
                    NavigationLink(destination: Inbox()) {
                        Image(systemName: "tray")
                        Text("Inbox")
                    }
                    Button() {
                    } label: {Image(systemName: "document"); Text("Drafts")
                    }
                    Button() {
                    } label: {Image(systemName: "paperplane"); Text("Sent")
                    }
                    Button() {
                    } label: {Image(systemName: "xmark.bin"); Text("Junk")
                    }
                    Button() {
                    } label: {Image(systemName: "trash"); Text("Trash")
                    }
                    Button() {
                    } label: {Image(systemName: "archivebox"); Text("Archive")
                    }
                    Divider()
                    Button() {
                    } label: {Image(systemName: "person"); Text("Personal")
                    }
                } label:{
                    Image(systemName: "ellipsis")
                        .font(.system(size: 20, weight: .bold))
                        .padding(10)
                }
                .buttonBorderShape(.circle)
                .buttonStyle(GlassButtonStyle())
                .padding(.top, 20)
            }
            .padding(.top, 10)
            .frame(height: 56)
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    NavigationLink(destination: SwipeView()) {
                        Image(systemName: "rectangle.stack")
                        Text("Cards")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.leading, 7)
                    .padding(.trailing, 12)
                    
                    Spacer()
                    Button("", systemImage: "magnifyingglass") {}
                    //                    Button("", systemImage: "square.and.pencil") {}
                    Button("", systemImage: "square.and.pencil") {
                        showSheet = true
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                EmptySheet(showSheet: $showSheet, Contacts: Contacts)
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    Navbar()
}
