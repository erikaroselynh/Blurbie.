import Foundation

struct Book: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let coverImageName: String
    let description: String
    let genre: String
}
