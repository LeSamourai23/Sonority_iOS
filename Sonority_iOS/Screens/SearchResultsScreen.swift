//
//  SearchResultsScreen.swift
//  Sonority_iOS
//
//  Created by Ayaan on 15/05/23.
//
import SwiftUI

struct SearchResultsView: View {
    let searchResults: [Albums]
    
    var body: some View {
        List(searchResults, id: \.self) { album in
            NavigationLink(destination: DetailView(album: album, albumsData: searchResults)) {
                Text(album.album)
                    .foregroundColor(.white)
            }
            .foregroundColor(bgColor)
        }
        .listStyle(DefaultListStyle()) // Apply the default list style
        .foregroundColor(Color.black)
    }
}
