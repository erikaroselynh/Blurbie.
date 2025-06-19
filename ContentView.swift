import SwiftUI
struct ContentView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @State private var isSplashFinished = false

    var body: some View {
        Group {
            if isSplashFinished {
                if isLoggedIn {
                    MainTabView()
                } else {
                    LoginView()
                }
            } else {
                SplashView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isSplashFinished = true
                }
            }
        }
    }
}
