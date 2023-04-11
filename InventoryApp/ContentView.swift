//
//  ContentView.swift
//  InventoryApp
//
//  Created by Pierre Juarez U. on 1/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var inventories: [InventoryModel] = []
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
                sectionTitle()
                
                List(inventories){ inventory in
                    VStack(alignment: .leading, spacing: 13){
                        HStack{
                            Image(systemName: inventory.icon)
                            Text(inventory.type.rawValue.uppercased())
                            Spacer()
                            Circle()
                                .fill(inventory.statusColor)
                                .frame(width: 10, height: 10)
                            Text(inventory.status)
                        }.foregroundColor(Color.gray)
                        
                        HStack{
                            Text(inventory.title)
                                .font(.system(size: 16, weight: .bold))
                        }
                        
                        HStack{
                            Text("For").foregroundColor(Color.gray)
                            Text(inventory.owner)
                            Image(systemName: "chevron.down")
                                .font(.system(size: 13, weight: .bold))
                            Spacer()
                            Text(inventory.time)
                        }
                        
                        
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        HStack{
                            Rectangle()
                                .fill(inventory.cardColor)
                                .padding(.vertical, -20)
                                .frame(width: 5)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                    )
                    .padding(.vertical, 20)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: Color.gray.opacity(0.2), radius: 15.0, x: 0, y:0)
                    .padding(.vertical, 5)
                    .listRowSeparator(.hidden)
                }
                .padding(.horizontal, 0)
                .listStyle(.plain)
                
            }

        }.onAppear{
//            inventories = InventoryModel.getInventory()
            inventories = Array(repeating: InventoryModel.getInventory(), count: 20).flatMap{$0}
        }
        
    }
}

struct InventoryModel: Identifiable {
    
    let id = UUID()
    let icon: String
    let statusColor: Color
    let type: ´Type´
    let title: String
    let status: String
    let owner: String
    let time: String
    let cardColor: Color
    
    enum ´Type´: String {
        case asset
        case troubleshot
    }
    
    static func getInventory() -> [Self]{
        return [
            InventoryModel(icon: "square.stack.3d.up.fill", statusColor: .cyan, type: .asset, title: "Request for a new Apple Macbook Pro", status: "OPEN", owner: "Pierre Juarez", time: "2m", cardColor: .cyan),
            InventoryModel(icon: "questionmark.circle.fill", statusColor: .green, type: .troubleshot, title: "Macbook not shutting down propertly!", status: "IN PROGRESS", owner: "Susan Bradley", time: "1h", cardColor: .orange),
            InventoryModel(icon: "square.stack.3d.up.fill", statusColor: .green, type: .troubleshot, title: "BENQ Monitor replacement request", status: "ACCEPTED", owner: "Nicholas Gilbert", time: "2d", cardColor: .blue),
            InventoryModel(icon: "questionmark.circle.fill", statusColor: .green, type: .troubleshot, title: "WiFi connection drops and slow internet", status: "SOLVED", owner: "Mathias Rojas", time: "3y", cardColor: .green)
        ]
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

struct sectionTitle: View{
    var body: some View{
        HStack{
            Text("Due today")
            
            Spacer()
            
            HStack{
                Text("Sort by")
                Button {
                    print("*")
                } label: {
                    Image(systemName: "slider.vertical.3")
                }

            }
        }
        .padding(.top, 20)
        .foregroundColor(Color.black.opacity(0.6))
        .padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

