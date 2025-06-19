import SwiftUI

struct RegisterView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("storedPassword") var storedPassword: String = ""
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Create your Blurbie account")
                .font(.title2)
                .bold()

            TextField("Full Name", text: $name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)

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
                    storedPassword = password 
                    isLoggedIn = true
                }
            }) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("Blurbie Pink Color"))
                    .cornerRadius(12)
            }
        }
        .padding()
        .navigationTitle("Sign Up")
    }
}
