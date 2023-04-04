//
//  ContentView.swift
//  InventoryApp
//
//  Created by Pierre Juarez U. on 1/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack{
                HeaderBackground()
                Spacer()
            }
        }
        
    }
}

struct HeaderBackground: View{
    var body: some View{
        Rectangle()
            .fill(LinearGradient(colors: [
                Color(red: 82/255, green: 133/255, blue: 246/255),
                Color(red: 40/255, green: 92/255, blue: 222/255),
                Color(red: 40/255, green: 92/255, blue: 222/255)
            ],startPoint: .bottom, endPoint: .top))
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .mask(
                ShapeRectangle()
            )
            .edgesIgnoringSafeArea(.top)
        
    }
}

struct ShapeRectangle: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Adding points to draw the rectangle
        path.move(to: CGPoint(x: rect.minX, y: rect.minY)) // top-left
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY)) // top-right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // bottom-right
        
        // Adding points to draw curve at the bottom
        let c1 = CGPoint(x: rect.midX + 50, y: rect.maxY + 20)
        let c2 = CGPoint(x: rect.midX - 50, y: rect.maxY + 20)
        
        path.addCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY), // bottom-left
            control1: c1,
            control2: c2
        )
        
        path.closeSubpath()
        
        return path
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

