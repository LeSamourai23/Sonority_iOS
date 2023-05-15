import SwiftUI

struct DetailView: View {
    var album: Albums
    var albumsData: [Albums] // Array of all albums data

    var similarAlbums: [Albums] {
        albumsData.filter { $0.genres == album.genres && $0.id != album.id }
                  .sorted { $0.rymRating > $1.rymRating }
    }

    var body: some View {
        VStack {
            Text(album.album)
                .font(.largeTitle)

            Text("Similar Albums")
                .font(.title)
                .padding()

            List(similarAlbums) { similarAlbum in
                NavigationLink(destination: AlbumDetailView(album: album, albumsData: albumsData)) {
                    Text(similarAlbum.album)
                }
            }
        }
    }
}
