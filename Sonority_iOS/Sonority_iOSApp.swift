//
//  Sonority_iOSApp.swift
//  Sonority_iOS
//
//  Created by Ayaan on 11/05/23.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import Combine

@main
struct Sonority_iOSApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    @State private var albumNetworkModel = AlbumNetworkModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(albumNetworkModel)
        }
    }
}

class AlbumViewModel: ObservableObject {
    @Published var albums: [albumMetadata] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let database = Database.database().reference()
    
    func fetchAlbums() {
        database.child("albums").observeSingleEvent(of: .value) { snapshot in
            guard let data = snapshot.value as? [[String: Any]] else { return }
            self.albums = data.compactMap { dict in
                guard let title = dict["Album"] as? String,
                      let artist = dict["Artist"] as? String,
                      let date = dict["Date"] as? String,
                      let genres = dict["Genres"] as? String,
                      let rymRating = dict["RYM Rating"] as? Double,
                      let ratings = dict["Ratings"] as? String,
                      let reviews = dict["Reviews"] as? Int,
                      let zRank = dict["zRank"] as? Int else { return nil }
                return albumMetadata(title: title, artist: artist, date: date, genres: genres, rymRating: rymRating, ratings: ratings, reviews: reviews, zRank: zRank)
            }
        }
    }
}
