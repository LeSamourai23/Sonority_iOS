import SwiftUI

struct AlbumDetailView: View {
    var album: Albums
    var albumsData: [Albums] // Array of all albums data

    var body: some View {
        GeometryReader{ geo in
            ZStack{
                
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text(album.album)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    VStack{
                        Text(album.artist)
                            .foregroundColor(.white)
                            .font(.title3)
                        
                        Text(album.date)
                            .foregroundColor(.white)
                        
                        Text(album.genres)
                            .foregroundColor(.white)
                        
                        Text(album.rymRating)
                            .foregroundColor(.white)
                    }
                }
            }
            .ignoresSafeArea()
            .onAppear {
                // Set the navigation bar background color to black
                UINavigationBar.appearance().backgroundColor = UIColor.black
            }
        }
    }
}

