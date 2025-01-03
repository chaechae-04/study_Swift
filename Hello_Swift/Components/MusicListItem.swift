//
//  MusicListItem.swift
//  Hello_Swift
//
//  Created by 이영수 on 1/3/25.
//

import SwiftUI

struct MusicListItem: View {
    
    let music: [[String]]
    @Binding var selected_music_name: String
    @Binding var music_info: [String]
    
    var body: some View {
        // ForEach 1 Start Point
        ForEach(music, id: \.self) { info in
            
            // HStack 2 Start Point
            HStack {
                Image("Images/Albums/\(info[1])")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 15)
                    )
                
                // VStack 3 Start Point
                VStack(alignment: .leading, content: {
                    Text("\(info[0])")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Colors/TextColor"))
                    Text(info[3].isEmpty ? "\(info[2])" : "\(info[2]) / \(info[3])")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Colors/TextColor"))
                
                })
                // VStack 3 End Point
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Button 2 Start Point
                Button {
                    
                    selected_music_name = info[0]
                    
                    if selected_music_name == music_info[0] {
                        music_info = ["", "", "", ""]
                        selected_music_name = music_info[0]
                    } else {
                        music_info = [info[0], info[1], info[2], info[3]]
                    }
                    
                } label: {
                    Image(systemName: "waveform")
                        .resizable()
                        .frame(width: 40, height: 30)
                        .foregroundColor(selected_music_name == info[0] ? .red : .gray)
                }
                // Button 2 End Point
                
            }
            // HStack 2 End Point
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .padding()
            .padding(.top, 0)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("Colors/BoxColor"))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 1)
                
            )
            
        }
        // ForEach 1 End Point
    }
    
}
