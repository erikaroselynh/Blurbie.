import SwiftUI

struct LoginView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @State private var email = ""
    @State private var password = ""
    @State private var showRegister = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to Blurbie 💖")
                    .font(.largeTitle)
                    .bold()

                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                Button(action: {
                    if !email.isEmpty && !password.isEmpty {
                        isLoggedIn = true
                    }
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("Blurbie Pink Color"))
                        .cornerRadius(12)
                }

                Button("Don't have an account? Sign Up") {
                    showRegister = true
                }
                .padding(.top)

                NavigationLink(destination: RegisterView(), isActive: $showRegister) {
                    EmptyView()
                }
            }
            .padding()
        }
    }
}

