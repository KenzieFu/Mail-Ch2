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
        
    }
}

// MARK: - Swipe Direction
enum SwipeDirections {
    case trash,important,none
}


struct CardStack: View {
    @State var mails:[Mail]
    @State var offset :CGSize = .zero
    
    // MARK: Actions
    private func handleSwipe(_ direction: SwipeDirections)->Void {
        _ = withAnimation { mails.removeFirst() }
      
    }
    var body: some View{
        
        ZStack{
            ForEach($mails) { $mail in
                Swipeable(mail:$mail){direction in
                    handleSwipe(direction)
                }
            }
        }
     
       
    }
}


struct Swipeable: View {

    @Binding var mail: Mail;
    var swipeThreshold:CGFloat = 100;
    let  onSwipe: (SwipeDirections) -> Void;
    
    
    // posititon of the object
    @State private var offset: CGSize = .zero   // CGSize is like Vector2
    @State private var isDragging = false
    
    var importantOpacity: Double {
        max(0, Double(offset.width / swipeThreshold)*0.4)
    }
 
    var trashOpacity: Double {
        max(0, Double(-offset.width / swipeThreshold)*0.4)
    }
    
    private func flyOut (direction: SwipeDirections){ // this will be inside the onchange func on drag gesture
        let movementBehaviour: CGFloat = direction == .important ? 600 : -600
        withAnimation(.easeOut(duration:0.5)){
            offset = CGSize(width:movementBehaviour, height:100)
        }// animation for moving the offset
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // make sure animation done , before triggering this func
                    onSwipe(direction)
        }
        
    }

    
    private var dragGesture : some Gesture {
        DragGesture()
            .onChanged{ value in
            offset = value.translation
            isDragging = true // calculate current position of the cursor position
          
        }
            .onEnded{value in
                 // make it stay back in position after not dragging
                isDragging=false
                let tx = value.translation.width
                if tx > swipeThreshold{
                    flyOut(direction: .important)
                    
                }
                else if tx < -swipeThreshold{
                    flyOut(direction: .trash)
                }
                else {
                    withAnimation(.spring()) { offset = .zero }
                }
               
        }
    }
    
    private var rotationAngle: CGFloat{
        Double(offset.width / 20)   // tilt is depends on the width of the object being dragged from the position.  the small is the division the more degree it will be
    }
    
    var body: some View{
        
        ZStack{
            if offset.width < 0 && isDragging {
                HStack(spacing:0){
                    Color.red
                        .ignoresSafeArea()
                        .containerRelativeFrame(.horizontal,alignment: .leading){length, _ in length/2}
                        .opacity(trashOpacity)
                    Spacer()
                }
            }else if offset.width > 0 && isDragging {
                HStack(spacing:0){
                    Spacer()
                    Color.green
                        .ignoresSafeArea()
                        .containerRelativeFrame(.horizontal,alignment: .trailing){length, _ in length/2}
                        .opacity(importantOpacity)
                }
            }
            SwipeCard().offset(offset)   // add state offset so the object can update its position
                .rotationEffect(.degrees(rotationAngle))  // add tilt
                .gesture(dragGesture)  // add the gesture
                .animation(.interactiveSpring(), value: offset)  // animation
                .scaleEffect(1 + (isDragging ? 0.1 : 0))
            
            
        }
        
       
          
    }
}

#Preview {
    SwipeView()
}
