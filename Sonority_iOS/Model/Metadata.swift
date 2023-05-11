//
//  Metadata.swift
//  Sonority_iOS
//
//  Created by Ayaan on 12/05/23.
//

import Foundation

struct albumMetadata: Decodable, Identifiable {
    
       let id = UUID()
       let title: String
       let artist: String
       let date: String
       let genres: String
       let rymRating: Double
       let ratings: String
       let reviews: Int
       let zRank: Int
}
