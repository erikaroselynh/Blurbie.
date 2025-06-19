import Foundation

struct Review: Identifiable {
    let id = UUID()
    let username: String
    let bookTitle: String
    let text: String
}
