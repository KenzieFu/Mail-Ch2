//
//  EmptySheet.swift
//  Mail-CH2
//
//  Created by Michelle Aldorino on 21/04/26.
//

import SwiftUI

struct EmptySheet: View {
    
    @Binding var showSheet: Bool
    
    @State private var toField: String = ""
    @State private var ccBccFrom: String = ""
    @State private var subject: String = ""
    @State private var bodyText: String = ""
    
    @State var Contacts: [Contact]
    var body: some View {
        NavigationStack{
            VStack() {
                VStack(spacing: 0) {
                    HStack {
                        Text("New Message")
                            .font(.system(size: 28, weight: .bold))
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 18) {
                            ForEach(Contacts) { contact in
                                VStack(spacing: 6) {
                                    ZStack {
                                        Circle()
                                            .fill(contact.bgColor)
                                            .frame(width: 68, height: 68)
                                        Text(String(contact.name.prefix(1)).uppercased())
                                            .font(.system(size: 30, weight: .bold))
                                            .foregroundColor(contact.textColor)
                                    }
                                    Text(contact.name)
                                        .font(.system(size: 12))
                                        .foregroundColor(.secondary)
                                }
                                .onTapGesture {
                                    toField = contact.name
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 16)
                    
                    VStack(spacing: 0) {
                        HStack {
                            Text("To :")
                                .foregroundColor(.secondary)
                            TextField("", text: $toField)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        
                        Divider().padding(.leading, 20)
                        
                        HStack {
                            Text("Cc/Bcc From :")
                                .foregroundColor(.secondary)
                                .frame(width: 110, alignment: .leading)
                            TextField("", text: $ccBccFrom)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        
                        Divider().padding(.leading, 20)
                        
                        HStack {
                            Text("Subject :")
                                .foregroundColor(.secondary)
                            TextField("", text: $subject)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        
                        Divider().padding(.leading, 20)
                    }
                    TextField("", text: $bodyText,axis:.vertical)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                    Spacer()
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button { showSheet = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
                ToolbarItem(placement: .topBarTrailing) {
                    Button { showSheet = false
                    } label: {
                        Image(systemName: "arrow.up")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        
    }
}
#Preview {
    EmptySheet(showSheet: .constant(true), Contacts: Contacts)
}
