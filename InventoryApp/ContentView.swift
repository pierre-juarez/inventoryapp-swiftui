//
//  ContentView.swift
//  InventoryApp
//
//  Created by Pierre Juarez U. on 1/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top){
            VStack{
                HeaderBackground()
                Spacer()
            }
            navbarCustom()
            
            VStack{
                Spacer()
                    .frame(height: 60)
                cardStatus()
                
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

struct navbarCustom: View{
    var body: some View{
        VStack{
            HStack{
                Button {
                    print("-")
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.system(size: 25, weight: .bold))
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                Spacer()
                Text("Inventory Management")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
                
                Button {
                    print("+")
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 25, weight: .bold))
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
            }.foregroundColor(Color.white)
        }
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

struct cardStatus: View{
    var body: some View{
        HStack{
            
            VStack(spacing: 10){
                Text("421")
                    .font(.system(size: 25, weight: .bold))
                Text("overdue")
                    .font(.system(size: 15))
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
            
            VStack(spacing: 10){
                Text("18")
                    .font(.system(size: 25, weight: .bold))
                Text("to do")
                    .font(.system(size: 15))
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
            
            VStack(spacing: 10){
                Text("72")
                    .font(.system(size: 25, weight: .bold))
                Text("open")
                    .font(.system(size: 15))
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
            
            VStack(spacing: 10){
                Text("51")
                    .font(.system(size: 25, weight: .bold))
                Text("due today")
                    .font(.system(size: 15))
                    .foregroundColor(Color.gray)
            }
            
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 20)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
        .shadow(color: Color.gray.opacity(0.3), radius: 15.0, x: 0, y:0)
        .padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

