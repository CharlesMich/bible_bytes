//
//  EditionView.swift
//  bible_talk
//
//  Created by Charles Michael on 2/17/25.
//

import SwiftUI

struct EditionView: View {
//    @State private var myEdition: String = NSUbiquitousKeyValueStore.default.string(forKey: "edition") ?? "hi"
    
    @State private var myEdition = UserDefaults.standard.string(forKey: "edition") ?? "hi"
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Choose Edition")
                Button {
                    ContentView()
                } label: {
                    Text("Jkfsjdfhskd")
                }
                Button {
//                    NSUbiquitousKeyValueStore.default.set("monday", forKey: "edition")
                    UserDefaults.standard.set("monday", forKey: "edition")
                    NavigationLink(destination: ContentView()) {
                        ContentView()
                                    }
                    print("charles", myEdition)
                } label: {
                    Text("Monday Edition")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.green)
                        .cornerRadius(10)
                }
                .padding()
                Button {
                    UserDefaults.standard.set("wednesday", forKey: "edition")
//                    NSUbiquitousKeyValueStore.default.set("tuesday", forKey: "edition")
                    print("charles", myEdition)
                } label: {
                    Text("Tuesday Edition")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.green)
                        .cornerRadius(10)
                }
                .padding()
                Spacer()
            }
            .navigationTitle("B Bytes")
            .navigationBarTitleDisplayMode(.inline)
        }
       
        
    }
}

#Preview {
    EditionView()
}
