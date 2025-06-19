import SwiftUI

struct BooksView: View {
    let books = [
        Book(
            title: "If He Had Been With Me",
            author: "Laura Nowlin",
            coverImageName: "hehad",
            description: "A bittersweet love story about missed chances and the 'what ifs' that haunt us.",
            genre: "Young Adult, Romance"
        ),
        Book(
            title: "A Good Girl's Guide to Murder",
            author: "Holly Jackson",
            coverImageName: "goodgirl",
            description: "A gripping murder mystery following Pip as she uncovers long-buried secrets.",
            genre: "Mystery, Thriller"
        ),
        Book(
            title: "It Ends With Us",
            author: "Colleen Hoover",
            coverImageName: "itends",
            description: "A powerful tale of love, resilience, and breaking the cycle of abuse.",
            genre: "Contemporary Romance"
        ),
        Book(
            title: "Twisted Love",
            author: "Ana Huang",
            coverImageName: "twistedlove",
            description: "A steamy enemies-to-lovers romance with secrets and emotional baggage.",
            genre: "New Adult Romance"
        ),
        Book(
            title: "The Love Hypothesis",
            author: "Ali Hazelwood",
            coverImageName: "lovehypo",
            description: "A STEM-themed rom-com about a fake relationship between a PhD candidate and a grumpy professor.",
            genre: "Romantic Comedy"
        ),
        Book(
            title: "Before We Were Strangers",
            author: "Renée Carlino",
            coverImageName: "before",
            description: "A heart-tugging second-chance romance about college love, separation, and fate.",
            genre: "Contemporary Romance"
        ),
        Book(
            title: "Beach Read",
            author: "Emily Henry",
            coverImageName: "beachread",
            description: "Two writers with opposing styles swap genres for the summer, discovering more than just storylines.",
            genre: "Romance, Fiction"
        )
    ]


    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(books) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            HStack(spacing: 16) {
                                Image(book.coverImageName)
                                    .resizable()
                                    .frame(width: 60, height: 90)
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text(book.title)
                                        .font(.headline)
                                    Text("by \(book.author)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Books")
        }
    }
}
