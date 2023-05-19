import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var album: Albums
    var albumsData: [Albums] // Array of all album data

    var similarAlbums: [Albums] {
        albumsData.filter { $0.genres == album.genres && $0.id != album.id }
                  .sorted { $0.rymRating > $1.rymRating }
    }

    init(album: Albums, albumsData: [Albums]) {
        self.album = album
        self.albumsData = albumsData

        // Use this line to remove extra separators below the list
        UITableView.appearance().tableFooterView = UIView()
    }

    var body: some View {
        ZStack {
            Color.black // Set the background color of the ZStack to black
                .ignoresSafeArea() // Ignore the safe area to cover the entire screen

            VStack {
                Text(album.album)
                    .font(.largeTitle)
                    .foregroundColor(.white) // Set the text color to white
                
                Text(album.artist)
                    .font(.system(size: 20))
                    .foregroundColor(.white)

                Text("Similar Albums")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white) // Set the text color to white

                List(similarAlbums) { similarAlbum in
                    NavigationLink(destination: AlbumDetailView(album: similarAlbum, albumsData: albumsData)) {
                        Text(similarAlbum.album)
                            .foregroundColor(.white) // Set the text color to white
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .listRowBackground(Color.black)
                    .foregroundColor(bgColor)
                    .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                }
                .listStyle(PlainListStyle())
                .environment(\.defaultMinListRowHeight, 50)
                .background(Color.black) // Set the background color of the entire view hierarchy to clear
                .edgesIgnoringSafeArea(.all) // Use PlainListStyle to remove the default list style
            }
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .onAppear {
            // Set the navigation bar background color to black
            UINavigationBar.appearance().backgroundColor = UIColor.black
        }
    }

    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left") // Use a minimal left icon for the back button
                .foregroundColor(.white) // Set the color of the back button to white
        }
    }
}
