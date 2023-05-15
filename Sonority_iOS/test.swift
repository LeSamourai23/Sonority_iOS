import SwiftUI
import Alamofire

struct AlbumDetailsView: View {
    var albumName: String
    var artistName: String
    @StateObject private var albumFetcher = AlbumFetcher()
    
    var body: some View {
        ScrollView {
            VStack {
                if let album = albumFetcher.album {
                    Image(album.coverImageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text(album.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(album.artist)
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    ForEach(album.tracks) { track in
                        HStack {
                            Text(track.title)
                                .fontWeight(.semibold)
                            Spacer()
                            Text(track.duration)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 8)
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            albumFetcher.fetchAlbumData(albumName: albumName, artistName: artistName)
        }
    }
}

class AlbumFetcher: ObservableObject {
    @Published var album: Album?
    
    func fetchAlbumData(albumName: String, artistName: String) {
        let apiKey = "6efcf9bfb59ff6e2f83219fe88c41db9"
        let artistEncoded = artistName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let albumEncoded = albumName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = "https://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=\(apiKey)&artist=\(artistEncoded)&album=\(albumEncoded)&format=json"

        
        print(url)
        
        AF.request(url).responseDecodable(of: LastFmResponse.self) { response in
            print(String(data: response.data ?? Data(), encoding: .utf8)!)

            if let album = response.value?.album {
                self.album = Album(title: album.name, artist: album.artist, coverImageURL: album.imageURL, tracks: self.mapTracks(lastFmTracks: album.tracks))
                print("Album decoded successfully: \(String(describing: self.album))")
            } else if let error = response.error {
                print("Error decoding response: \(error.localizedDescription)")
            } else {
                print("Unknown error decoding response")
            }
        }

    }
    
    func mapTracks(lastFmTracks: [LastFmTrack]) -> [Track] {
        var tracks = [Track]()
        
        for track in lastFmTracks {
            tracks.append(Track(title: track.name, duration: track.duration))
        }
        
        return tracks
    }
}

struct Album {
    var title: String
    var artist: String
    var coverImageURL: String
    var tracks: [Track]
}

struct Track: Identifiable {
    var id = UUID()
    var title: String
    var duration: String
}

struct LastFmResponse: Decodable {
    var album: LastFmAlbum
}

struct LastFmAlbum: Decodable {
    var name: String
    var artist: String
    var imageURL: String
    var tracks: [LastFmTrack]
    
    enum CodingKeys: String, CodingKey {
        case name
        case artist = "artist"
        case imageURL = "image"
        case tracks = "tracks"
    }
}

struct LastFmTrack: Decodable {
    var name: String
    var duration: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case duration = "duration"
    }
}

struct AlbumDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailsView(albumName: "25", artistName: "Adele")
    }
}

