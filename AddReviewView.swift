import SwiftUI

struct AddReviewView: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding var reviews: [Review]

    @State private var username: String = ""
    @State private var bookTitle: String = ""
    @State private var reviewText: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User")) {
                    TextField("Enter your name", text: $username)
                }

                Section(header: Text("Book Title")) {
                    TextField("Enter the book title", text: $bookTitle)
                }

                Section(header: Text("Your Review")) {
                    TextEditor(text: $reviewText)
                        .frame(height: 120)
                }
            }
            .navigationTitle("Add Review")
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Submit") {
                    let newReview = Review(username: username, bookTitle: bookTitle, text: reviewText)
                    reviews.append(newReview)
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(username.isEmpty || bookTitle.isEmpty || reviewText.isEmpty)
            )
        }
    }
}
//
//  AddReviewView.swift
//  Blurbie
//
//  Created by Hibiskus2 on 15/06/25.
//

