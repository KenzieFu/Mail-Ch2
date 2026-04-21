//
//  mail.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 18/04/26.
//
import SwiftUI

struct Mail: Identifiable {
    var id: UUID = UUID()
    
    //characteristic
    var sender: String
    var color: Color
    var subject: String
    var date: Date
    var recipient: String
    var summary: String
    var isRead: Bool
    
    init(sender: String, color: Color, subject: String, date: Date, recipient: String, summary: String, isRead: Bool) {
        self.sender = sender
        self.color = color
        self.subject = subject
        self.date = date
        self.recipient = recipient
        self.summary = summary
        self.isRead = isRead
    }
    
    //function
    func open() {
        //TBA
    }
}
