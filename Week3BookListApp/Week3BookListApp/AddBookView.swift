//
//  AddBookView.swift
//  Week3BookListApp
//
//  Created by Adib Samoon on 2025-10-17.
//

import SwiftUI

struct AddBookView: View {
    @EnvironmentObject var viewModel: BookListViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var author: String = ""
    
    
    var body: some View {
        Form {
            Section(header: Text("Add New Book")) {
                TextField("Title", text: $title)
                TextField("Author", text: $author)
                

            }
            
            Section {
                Button("Add Book") {
                    addBook()
                }
                .disabled(title.isEmpty || author.isEmpty)
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity, alignment: .center)
                
                    
            }
                
        }
       
    }
    
    private func addBook() {
           
           guard !title.trimmingCharacters(in: .whitespaces).isEmpty,
                 !author.trimmingCharacters(in: .whitespaces).isEmpty else { return }
           
           viewModel.addBook(title: title, author: author)
           dismiss()
       }
}

#Preview {
    NavigationView {
            AddBookView()
                .environmentObject(BookListViewModel())
    }
}
