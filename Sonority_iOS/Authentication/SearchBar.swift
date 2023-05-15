import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(inpColor.opacity(0)))
                .padding(.horizontal)

            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
        }
        
    }
}
