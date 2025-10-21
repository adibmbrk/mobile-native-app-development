//
//  BookModel.swift
//  Week3BookListApp
//
//  Created by Adib Samoon on 2025-10-17.
//

import Foundation

struct Book: Identifiable {
    let id = UUID()
    let title: String
    let author: String
}
