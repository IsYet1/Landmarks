//
//  ModelData.swift
//  Landmarks
//
//  Created by Don McKenzie on 11/29/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    // Don't need Published since this data won't be modified so won't ever need to update the UI. Won't be subscribed to.
    var hikes: [Hike] = load("hikeData.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
