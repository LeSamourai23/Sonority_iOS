import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var searchResults: [Albums] = []

    var filteredResults: [Albums] {
        if searchText.isEmpty {
            return searchResults
        } else {
            return searchResults.filter { $0.album.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .padding()

            List(filteredResults, id: \.self) { album in
                NavigationLink(destination: DetailView(album: album, albumsData: searchResults)) {
                    Text(album.album)
                }
            }
        }
        .onAppear {
            searchResults = loadCSV(from: "output") // Replace "albums" with your CSV file name
        }
    }
}
