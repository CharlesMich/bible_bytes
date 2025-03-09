//
//  Bundle-Decodable.swift
//  bible_talk
//
//  Created by Charles Michael on 3/8/25.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from:data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("failed to decode \(file) from bundle do to missing key '\(key.stringValue)' - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("failed to decode \(file) from bundle do to type mismatch \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context){
            fatalError("failed to decode \(file) from bundle do to missing \(type) value -\(context.debugDescription)")
        } catch  DecodingError.dataCorrupted(_){
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
