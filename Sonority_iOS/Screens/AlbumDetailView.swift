import SwiftUI

struct AlbumDetailView: View {
    var album: Albums
    var albumsData: [Albums] // Array of all albums data

    var body: some View {
        VStack {
            Text(album.album)
                .font(.largeTitle)
            
            Text(album.artist)
            
            Text(album.date)
            
            Text(album.genres)
            
            Text(album.rymRating)
            
            
        }
    }
}

