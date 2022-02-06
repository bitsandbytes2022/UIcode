//
//  ContentView.swift
//  swiftapp coop mote
//
//  Created by Cerow Aligab on 2/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedDate: Date = Date()
    let startingDate: Date = Date()
    
    let endingDate: Date = Calendar.current.date(from:DateComponents(year: 2050)) ?? Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
    
    @State var isOn: Bool = false
    
    @State var auto: Bool = false
    
    
    @State var foodP: CGFloat = 1.0

    @State var waterP: CGFloat = 1.0

    
    
    var body: some View {
    
   
    
        
      ZStack
        {
            
            Image("background")
                .resizable()
                .ignoresSafeArea()
        VStack
        {
           HStack
            {
                
            Spacer()
            Text("CoopMote")
                .foregroundColor(Color.white)
                .padding()
                
            Spacer()
                
                Image("MamaKimLogo")
                    .resizable()
                    .frame(width:81, height:81 )
                    .padding()
           
                
            Spacer()
            Text("Temp?")
                .foregroundColor(Color.white)
                .padding()
            Spacer()
           
           }
            
            Spacer()
                .frame(height:30)
            
            HStack{
                
                Spacer()
                ZStack{
               
                
                VStack{
                    
                    Text("Food Status: ")
                        .foregroundColor(Color.green)
                    
                    
                    Text("\(Int(self.foodP*100))%")
                        .font(.custom("HelveticaNeue", size: 20.0))
                        .foregroundColor(Color.white)
                        
                    
                    }
                    
                Circle()
                    .trim(from: 0.0, to: foodP)
                    .stroke(Color.green, lineWidth: 8)
                    .frame(width: 175, height: 175)
                    
                
                
               
                }
                Spacer()
               ZStack
                {
                    VStack{
                        Text("Water Status: ")
                            .foregroundColor(Color.blue)
                Text("\(Int(self.waterP*100))%")
                        .font(.custom("HelveticaNeue", size: 20.0))
                        .foregroundColor(Color.white)
                      }
                Circle()
                    .trim(from: 0.0, to: waterP)
                    .stroke(Color.blue, lineWidth: 8)
                    .frame(width: 175, height: 175)
                }
                Spacer()
                
            }
            
            Spacer()
            
            HStack{
                
            Spacer()
                
                VStack(alignment: .leading) {
                          Text("Door Control").font(.system(size: 22, weight: .semibold)).lineLimit(2)
                          HStack {
                              if self.isOn {
                                  Text("Open")
                              } else {
                                  Text("Closed")
                              }
                              Spacer()
                              Toggle("", isOn: $isOn)
                          }
                      }
                      .frame(width: 120)
                      .padding()
                      .overlay(
                          RoundedRectangle(cornerRadius: 10)
                              .stroke(self.isOn ? Color.green: Color.gray, lineWidth: 2) // <7>
                      )
                
                Spacer()
                
                VStack(alignment: .leading) {
                          Text("Auto or Manual").font(.system(size: 22, weight: .semibold)).lineLimit(2)
                          HStack {
                              if self.auto {
                                  Text("Auto")
                              } else {
                                  Text("Manual")
                              }
                              Spacer()
                              Toggle("", isOn: $auto)
                          }
                      }
                      .frame(width: 120)
                      .padding()
                      .overlay(
                          RoundedRectangle(cornerRadius: 10)
                              .stroke(self.auto ? Color.red: Color.gray, lineWidth: 2) // <7>
                      )
                
                Spacer()
                
            }
            
         Spacer()
                .frame(height: 65)
            
            
            
            HStack{
              
                VStack {
                 
                    DatePicker("Select a Time", selection:$selectedDate,in:startingDate...endingDate )
                        .foregroundColor(Color.blue)
                        
                    
                    
                    
                    Text("Selected Time For Door Open is:")
                        .foregroundColor(Color.white)
                       
                        
                    
                    Text(dateFormatter.string(from: selectedDate))
                        .font(.title)
                        .foregroundColor(Color.white)
                    
                }
    
                
                
                
                
                
            }
            
            Spacer()
                .frame(height: 50)
        }
      
            

        }
        
        
        
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    } 
}
