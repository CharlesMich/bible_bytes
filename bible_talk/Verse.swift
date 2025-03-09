//
//  Verse.swift
//  bible_talk
//
//  Created by Charles Michael on 3/8/25.
//

import Foundation

struct Verse: Codable, Identifiable {
    let id: String
    let verse: String
    let edition: String
//    let catagory: String
}
