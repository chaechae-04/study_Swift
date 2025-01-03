//
//  ContentView.swift
//  Hello_Swift
//
//  Created by 이영수 on 1/2/25.
//

import SwiftUI

struct ContentView: View {
    
    // [["name", "album", "artist", "featuring"]]
    let music_list: [[String]] =
                    [["tv off", "GNX", "Kendrick Lamar", "Lefty Gunplay"],
                     ["Still D.R.E.", "DRE_2001", "Dr. Dre", "Snoop Dogg"],
                     ["redrum" , "american_dream", "21 Savage", ""],
                     ["DNA.", "DAMN_COLLECTORS_EDITION", "Kendrick Lamar", ""],
                     ["Not Like Us", "Not_Like_Us_single", "Kendrick Lamar", ""],
                     ["luther", "GNX", "Kendrick Lamar & SZA", ""],
                     ["range brothers", "The_Melodic_Blue", "Baby Keem & Kendrick Lamar", ""],
                     ["rockstar", "beerbongs&bentleys", "Post Malone", "21 Savage"],
                     ["Dancing In The Flames", "Dancing_In_The_Flames_EP", "The Weekend", ""],
                     ["FE!N", "UTOPIA", "Travis Scott", "Playboy Carti"]]
    
    // Musci Click -> info
    @State private var music_info: [String] = ["", "", "", ""]
    @State private var selected_music_name: String = ""
    @State private var search_music: String = ""
    
    var body: some View {
        // VStack 1 Start Point
        VStack {
            
            // ScollView 1 Start Point
            ScrollView {
                
                // HStack 1 Start Point
                HStack {
                    Image(systemName: "music.note.list")
                        .resizable()
                        .frame(width: 25, height: 20, alignment: .leading)
                        .padding(.leading, 40)
                    
                    TextField("Search_music", text: $search_music)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .frame(height: 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 1)
                                .padding(.leading, -10)
                                .padding(.trailing, -10)
                        )
                        .padding(.leading, 40)
                        .padding(.trailing, 10)
                        
                    
                    // Button 1 Start Point
                    Button {
                        // button action
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .trailing)
                            .padding(.trailing, 30)
                    }
                    // Button 1 End Point
                    
                }
                // HStack 1 End Point
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .padding(0)
                
                // VStack 2 Start Point
                VStack {
                    
                    // ForEach 1 Start Point
                    ForEach(music_list, id: \.self) { info in
                        
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
                // VStack 2 End Point
                .frame(maxWidth: .infinity)
                .padding()
                
            }
            // ScrollView 1 End Point
            
            // VStack 4 Start Point
            VStack {
                
                // HStack 3 Start Point
                HStack {
                    Image("Images/Albums/\(music_info[1])")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                        )
                    
                    // VStack 5 Start Point
                    VStack(alignment: .leading, content: {
                        Text("\(music_info[0])")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Colors/TextColor"))
                        Text(music_info[3].isEmpty ? "\(music_info[2])" : "\(music_info[2]) / \(music_info[3])")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Colors/TextColor"))
                    
                    })
                    // VStack 5 End Point
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                // HStack 3 End Point
                .frame(maxWidth: .infinity)
                .frame(height: selected_music_name == "" ? 0 : 80)
                
                Text("")
                    .frame(maxWidth: .infinity)
                    .frame(height: selected_music_name == "" ? 0 : 15)
                    .border(Color.green)
                    .padding(.top, selected_music_name == "" ? 0 : 5)
                
            }
            // VStack 4 End Point
            .padding(selected_music_name == "" ? 0 : 15)
            .frame(height: selected_music_name == "" ? 0 : 140)
            .border(Color.black)
            
        }
        // VStack 1 End Point
        .background(Color("Colors/BodyColor"))
         
    }
    // body End Point
    
}


#Preview {
    ContentView()
}
