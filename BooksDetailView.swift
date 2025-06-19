import SwiftUI

struct BookDetailView: View {
    let book: Book

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(book.coverImageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .padding()

                Text(book.title)
                    .font(.title)
                    .bold()

                Text("by \(book.author)")
                    .font(.headline)
                    .foregroundColor(.secondary)

                Text("Genre: \(book.genre)")
                    .font(.subheadline)
                    .padding(.top, 4)

                Text(book.description)
                    .font(.body)
                    .padding(.top, 8)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
