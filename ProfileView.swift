import SwiftUI

struct ProfileView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Hello, Rosie 💖")
                    .font(.largeTitle)
                    .bold()

                Text("Welcome back to your Blurbie profile!")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                NavigationLink(destination: SettingsView()) {
                    HStack {
                        Image(systemName: "gear")
                        Text("Profile Settings")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}

