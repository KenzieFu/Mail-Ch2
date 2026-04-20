//
//  MailRow.swift
//  Mail-CH2
//
//  Created by Michelle Aldorino on 18/04/26.
//

import SwiftUI

struct MailRow: View {
    var femail: Mail
    var body: some View {
      
        
        HStack (spacing: 12) {
            Circle()
                .foregroundStyle(Color.blue)
                .frame(width: 8)
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 50, height: 50)
                .overlay(
                    Text("PN")
                        .foregroundColor(.white)
                        .font(.subheadline)
                )
            
                VStack (alignment: .leading) {
                    HStack {
                        Text(femail.sender)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        HStack
                        {
                            Text(femail.date, format: .dateTime.day().month().year())
                            Image(systemName: "chevron.right.circle")
                        }
                        .foregroundColor(.gray)
                        .font(.caption)
                    }

                
                    Text(femail.subject)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(femail.summary)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
        
    }
}


#Preview {
    // 3. The preview needs dummy data to compile now
    MailRow(femail: Mail(sender: "The Miro Team", subject:"New Activity", date:Date(),recipient:"Ethereal",summary:"Enjoy your meal! 🍽️"))
}
