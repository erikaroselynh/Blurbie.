import SwiftUI

struct SettingsView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    @AppStorage("notificationsEnabled") var notificationsEnabled: Bool = true
    @AppStorage("darkModeEnabled") var darkModeEnabled: Bool = false

    @State private var showPasswordAlert = false
    @State private var passwordInput = ""
    @State private var showPasswordError = false
    @State private var showLogoutConfirm = false

    @AppStorage("storedPassword") var storedPassword: String = ""
    var body: some View {
        Form {
            Section(header: Text("Account")) {
                HStack {
                    Text("Email")
                    Spacer()
                    Text("rosie@example.com")
                        .foregroundColor(.gray)
                }

                HStack {
                    Text("Username")
                    Spacer()
                    Text("rosie")
                        .foregroundColor(.gray)
                }
            }

            Section(header: Text("Preferences")) {
                Toggle(isOn: $notificationsEnabled) {
                    Text("Enable Notifications")
                }

                Toggle(isOn: $darkModeEnabled) {
                    Text("Dark Mode")
                }
            }

            Section {
                Button(action: {
                    showPasswordAlert = true
                }) {
                    Text("Delete Account")
                        .foregroundColor(.red)
                }

                Button(role: .destructive) {
                    showLogoutConfirm = true
                } label: {
                    Text("Logout")
                }
            }
        }
        .preferredColorScheme(darkModeEnabled ? .dark : .light)
        .navigationTitle("Settings")

       
        .alert("Confirm Delete", isPresented: $showPasswordAlert, actions: {
            SecureField("Enter password", text: $passwordInput)
            Button("Delete", role: .destructive) {
                if passwordInput == storedPassword {
                    isLoggedIn = false
                    storedPassword = "" 
                } else {
                    showPasswordError = true
                }
            }
            Button("Cancel", role: .cancel) {}
        }, message: {
            Text("Please enter your password to confirm deletion.")
        })
        .alert("Wrong Password", isPresented: $showPasswordError) {
            Button("OK", role: .cancel) {}
        }
        .alert("Are you sure you want to log out?", isPresented: $showLogoutConfirm, actions: {
            Button("Log Out", role: .destructive) {
                isLoggedIn = false
            }
            Button("Cancel", role: .cancel) {}
        })
    }
}

