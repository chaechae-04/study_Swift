//
//  ContentView.swift
//  Hello_Swift
//
//  Created by 이영수 on 1/2/25.
//

import SwiftUI

struct ContentView: View {
    
    let music_list: [String] = ["tv off", "Still D.R.E.", "redrum" ,"DNA." ,"Not Like Us" ,"luther" ,"range brothers" ,"rockstar" ,"Dancing In The Frames", "FE!N"]
    let artist_list: [[String]] = [["Kendrick Lama", "Lefty Gunplay"], ["Dr. Dre", "Snoop Dogg"],["21 Savage", ""],  ["Kendrick Lama", ""], ["Kendrick Lama & SZA", ""], ["Baby Keem & Kendrick Lama", ""], ["Post Malone", "21 Savage"], ["The Weekend", ""], ["Travis Scott", "Playboy Carti"]]
    
    var body: some View {
        // VStack 1 Start Point
        VStack {
            
            // ScollView 1 Start Point
            ScrollView {
                
                // VStack 2 Start Point
                VStack {
                    
                    // ForEach 1 Start Point
                    ForEach(Array(zip(music_list, artist_list)), id: \.0) { title, artist in
                        
                        // HStack 1 Start Point
                        HStack {
                            Text("img")
                                .frame(width: 75, height: 75)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                )
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                            
                            // VStack 3 Start Point
                            VStack {
                                Text("\(title)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("TextColor"))
                                Text(artist[1].isEmpty ? "\(artist[0])" : "\(artist[0]) / \(artist[1])")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("TextColor"))
                                
                            }
                            // VStack 3 End Point
                            
                        }
                        // HStack 1 End Point
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color("BoxColor"))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 1)
                            
                        )
                        
                    }
                    // ForEach 1 End Point
                    
                }
                // VStack 2 End Point
                .frame(maxWidth: .infinity)
                .padding()
                
            }
            // ScrollView 1 End Point
            
            // HStack 1 Start Point
            HStack {
                Text("Hstack")
            }
            // HStack 1 End Point
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .border(Color.blue)
        }
        // VStack 1 End Point
        .background(Color("BodyColor"))
         
    }
    // body End Point
}


#Preview {
    ContentView()
}
