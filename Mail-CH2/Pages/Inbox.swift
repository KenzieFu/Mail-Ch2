//
//  Inbox.swift
//  Mail-CH2
//
//  Created by Michelle Aldorino on 18/04/26.
//

import SwiftUI

struct Inbox: View {
    @Environment(MailStore.self) var mailStore

    @State private var selectedIndex: Int = 0
    @State private var showSheet = false
    @State private var isSearching = false
    @State private var searchText = ""
    @FocusState private var searchFocused: Bool
    
    var filteredMails: [Mail] {
        switch selectedIndex {
        case 1: return mailStore.unreadMail()    // Unread
        case 2: return mailStore.readMail()      // Read
        default: return mailStore.mails          // All Mail
        }
    }
    
    var body: some View {
        NavigationStack {
            Categories(selectedIndex: $selectedIndex)
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    Section {
                        ForEach(filteredMails) { mail in
                            let idx = mailStore.mails.firstIndex(where: { $0.id == mail.id }) ?? 0
                            MailRow(
                                femail: mail,
                                allMails: mailStore.mails,
                                currentIndex: idx
                            )
                            .padding(.vertical, 8)
                        }
                    }
                }
            }
            
            .toolbar{
                ToolbarItem(placement: .principal) {
                                       VStack {
                                           Text("All Inboxes")
                                               .font(.headline)
                                           Text("Updated Just Now")
                                               .font(.subheadline)
                                               .foregroundColor(.secondary)
                                       }
                                   }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
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
                    .padding(.vertical, 10)
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    if isSearching{
                        NavigationLink(destination: SwipeView()) {
                            Image(systemName: "line.3.horizontal.decrease")
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.horizontal, 7)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.secondary)
                            TextField("Search mail...", text: $searchText)
                                .focused($searchFocused)
                                .submitLabel(.search)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Button("", systemImage: "multiply") {
                            withAnimation(.spring(duration: 0.3)) {
                                isSearching = false
                                searchText = ""
                                searchFocused = false
                            }
                        }
                        
                    } else {
                        Button() {
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease")
                                .foregroundStyle(Color(.white))
                                .padding(.horizontal, 15)
                                .padding(.vertical,10)
                                .background(Color.blue)
                                .clipShape(Capsule())
                            VStack (alignment: .leading){
                                Text("Filter by")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                HStack{
                                    Text("Primary")
                                        .font(.subheadline)
                                    Image(systemName: "chevron.down")
                                        .font(.caption)
                                }
                                .foregroundStyle(Color(.blue))
                            }
                            .padding(.leading, 7)
                            .padding(.trailing, 12)
                        }
                        Spacer()
                        Button("", systemImage: "magnifyingglass") {
                            withAnimation(.spring(duration: 0.3)) {
                                isSearching = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                searchFocused = true
                            }
                        }
                        Button("", systemImage: "square.and.pencil") {
                            showSheet = true
                        }
                        .sheet(isPresented: $showSheet) {
                            EmptySheet(showSheet: $showSheet, Contacts: Contacts)
                                .presentationDragIndicator(.visible)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Inbox().environment(MailStore())
}
