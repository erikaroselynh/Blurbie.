import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            BooksView()
                .tabItem {
                    Label("Books", systemImage: "book.fill")
                }
            
            ReviewsView()
                .tabItem {
                    Label("Reviews", systemImage: "text.bubble.fill")
                }
            
            LibraryView()
                .tabItem {
                    Label("Library", systemImage: "books.vertical.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .accentColor(Color("Blurbie Pink Color"))
    }
}
