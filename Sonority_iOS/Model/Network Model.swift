import Foundation

@MainActor
class AlbumNetworkModel: ObservableObject {
    @Published var album: albumMetadata?
    let databaseURL = "https://sonority-b27c5-default-rtdb.firebaseio.com/" // replace with your Firebase Realtime Database URL
    
    func fetchAlbum() {
        guard let url = URL(string: databaseURL) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    self.album = try decoder.decode(albumMetadata.self, from: data)
                } catch let error {
                    print("Error decoding JSON data: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

