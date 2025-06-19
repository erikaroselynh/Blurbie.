import SwiftUI

struct ReviewsView: View {
    @State private var reviews: [Review] = [
        Review(username: "Rosie", bookTitle: "It Ends With Us", text: "They say love is worth fighting for. This one broke me 😭."),
        Review(username: "Lana", bookTitle: "A Good Girl's Guide to Murder", text: "They say everyone has secrets. Such a gripping mystery!"),
        Review(username: "Theo", bookTitle: "If He Had Been With Me", text: "They say some love stories never end. This one shattered me.")
    ]
    
    @State private var showingAddReview = false

    var body: some View {
        NavigationView {
            List {
                ForEach(reviews) { review in
                    VStack(alignment: .leading, spacing: 8) {
                        Text("📖 \(review.bookTitle)")
                            .font(.headline)
                        Text("🗣️ @\(review.username)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("💬 \"\(review.text)\"")
                    }
                    .padding(.vertical, 8)
                }
                .onDelete(perform: deleteReview)
            }
            .navigationTitle("Reviews")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddReview = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddReview) {
                AddReviewView(reviews: $reviews)
            }
        }
    }
    
    func deleteReview(at offsets: IndexSet) {
        reviews.remove(atOffsets: offsets)
    }
}

