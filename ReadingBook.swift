import Foundation
struct ReadingBook: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let coverImage: String
    let progress: Double   
}
