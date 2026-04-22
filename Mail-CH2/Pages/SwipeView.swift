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
        
        ZStack{
            HStack (spacing:0) {
                Color.green.frame(maxWidth:.infinity, maxHeight:.infinity)
                Color.red.frame(maxWidth:.infinity, maxHeight:.infinity).ignoresSafeArea()
            }.ignoresSafeArea()
            
            ForEach($mails) { $mail in
                Swipeable(mail:$mail)
            }

        }
     
       
    }
}


struct Swipeable: View {
    @State var isDrag=false;
    @Binding var mail: Mail;
    var swipeThreshold:CGFloat = 50;
    
    
    // posititon of the object
    @State private var offset: CGSize = .zero   // CGSize is like Vector2
    @State private var isDragging = false
    
    var likeOpacity: Double {
        max(0, Double(offset.width / swipeThreshold))
    }
 
    var nopeOpacity: Double {
        max(0, Double(-offset.width / swipeThreshold))
    }
    
    private var dragGesture : some Gesture {
        DragGesture()
            .onChanged{ value in
            offset = value.translation
            isDragging = true // calculate current position of the cursor position
        }
            .onEnded{value in
                offset = .zero  // make it stay back in position after not dragging
                isDragging=false
                withAnimation(.spring()) { offset = .zero }
        }
    }
    
    private var rotationAngle: CGFloat{
        Double(offset.width / 20)   // tilt is depends on the width of the object being dragged from the position.  the small is the division the more degree it will be

    }
    
    var body: some View{
        
      
        SwipeCard().offset(offset)   // add state offset so the object can update its position
            .rotationEffect(.degrees(rotationAngle))  // add tilt
            .gesture(dragGesture)  // add the gesture
            .animation(.interactiveSpring(), value: offset)  // animation
            .scaleEffect(1 + (isDragging ? 0.1 : 0))
    }
}

#Preview {
    SwipeView()
}
