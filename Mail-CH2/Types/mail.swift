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
    var subject: String
    var date: Date
    var recipient: String
    var summary: String
    
    init(sender: String, subject: String, date: Date, recipient: String, summary: String) {
        self.sender = sender
        self.subject = subject
        self.date = date
        self.recipient = recipient
        self.summary = summary
    }
    
    //function
    func open() {
        //TBA
    }
}
