//
//  BookListView.swift
//  Week3BookListApp
//
//  Created by Adib Samoon on 2025-10-17.
//

import SwiftUI

struct BookListView: View {
    
    @EnvironmentObject var viewModel: BookListViewModel
    
    var body: some View {
        NavigationView {
            List (viewModel.books) { book in
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    Text("by \(book.author)")
                        .font(.subheadline)
                }
            }
            .navigationTitle("Book List")
            .toolbar {
                NavigationLink(destination: AddBookView()) {
                                   Label("Add Book", systemImage: "plus")
                }
            }
        }
    }
}

#Preview {
    BookListView()
            .environmentObject(BookListViewModel())
}
