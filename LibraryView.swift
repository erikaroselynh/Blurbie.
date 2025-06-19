import SwiftUI

struct LibraryView: View {
    let currentReads: [ReadingBook] = [
        ReadingBook(title: "If He Had Been With Me", author: "Laura Nowlin", coverImage: "hehad", progress: 0.8),
        ReadingBook(title: "It Ends With Us", author: "Colleen Hoover", coverImage: "itends", progress: 0.55),
        ReadingBook(title: "A Good Girl's Guide to Murder", author: "Holly Jackson", coverImage: "goodgirl", progress: 0.35)
    ]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("📖 Current Reads")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                List(currentReads) { book in
                    HStack(alignment: .top, spacing: 16) {
                        Image(book.coverImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 90)
                            .clipped()
                            .cornerRadius(8)

                        VStack(alignment: .leading, spacing: 6) {
                            Text(book.title)
                                .font(.headline)
                            Text(book.author)
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            ProgressView(value: book.progress)
                                .accentColor(Color("Blurbie Pink Color"))

                            Text("\(Int(book.progress * 100))% completed")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 6)
                }
                .listStyle(.plain)
            }
            .navigationTitle("My Library")
        }
    }
}
