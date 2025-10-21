//
//  BookListViewModel.swift
//  Week3BookListApp
//
//  Created by Adib Samoon on 2025-10-17.
//

import Foundation
import Combine

class BookListViewModel: ObservableObject {
    @Published private(set) var books: [Book] = [
        Book(title: "1984", author: "George Orwell"),
        Book(title: "To Kill a Mockingbird", author: "Harper Lee"),
        Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald")
    ]
    
    func addBook(title: String, author: String) {
        let newBook = Book(title: title, author: author)
        books.append(newBook)
    }
}
