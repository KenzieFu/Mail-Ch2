//
//  SwipeView.swift
//  Mail-CH2

//  Created by Kenzie Fubrianto on 21/04/26.
//

import SwiftUI

struct SwipeView: View {
    
    var body: some View {
        VStack{
            CardStack(mails:mails)
        }.frame(maxWidth:.infinity, maxHeight:.infinity).background(Color(hex:"#727272"))
        
       // make each card have state
       // TO SWIPE
        // TO OVERLAY
        // ANGLE
        // POSITION IF NOT DRAGGED
    }
}



struct CardStack: View {
    @State var mails:[Mail]
    var body: some View{
        ZStack {
            ForEach($mails) { $mail in
                Swipeable(mail:$mail)
            }
        }
       
    }
}


struct Swipeable: View {
    @State var isDrag=false;
    @Binding var mail: Mail;
    
    
    // posititon of the object
    @State private var offset: CGSize = .zero
    @State private var isDragging = false
    
    private var dragGesture : some Gesture {
        DragGesture()
            .onChanged{ value in
            offset = value.translation
            isDragging = true
        }
            .onEnded{value in
                offset = .zero
                isDragging=false
                withAnimation(.spring()) { offset = .zero }
        }
    }
    
    var body: some View{
        SwipeCard().offset(offset).gesture(dragGesture).animation(.interactiveSpring(), value: offset)
    }
}

#Preview {
    SwipeView()
}
