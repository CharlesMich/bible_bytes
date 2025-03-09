//
//  ContentView.swift
//  bible_talk
//
//  Created by Charles Michael on 2/17/25.
//

import SwiftUI

struct ContentView: View {
    
    let verses: [Verse] = Bundle.main.decode("verses.json")
   
    
   
    
    var body: some View {
        
        NavigationStack{
            VStack {
                Section{
                    if let randomVerse = randomVerse() {
                        VStack {
                            
                            HStack {
                                Text("verse of the day")
                                Spacer()
                            }
                               
                            Text(randomVerse.verse)
                            NavigationLink {
                                TodaysVerse()
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("Read more...")
                                }
                            }
                        }
                        .padding()
                       
                    } else {
                        Text("Loading...")
                    }
                }
                
                .background(.yellow)
                .cornerRadius(10)
               
                
               
                ForEach(verses){ verse in
                    Text(verse.verse)}
                Text("Verse of the day")
                Text("Pick a verse for me")
                Text("Verse by topic")
                
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading){
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.black)
                    }
                }
                ToolbarItem (placement: .principal) {
                    Text("BEE BYTES")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.primary)
                }
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button {
                        
                    }label: {
                        Text("Edition")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
    
    func randomVerse() -> Verse? {
        return verses.randomElement()
    }
}

#Preview {
    ContentView()
}
