//
//  ContentView.swift
//  Week3BookListApp
//
//  Created by Adib Samoon on 2025-10-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BookListView()
    }
}

#Preview {
    ContentView()
            .environmentObject(BookListViewModel())
}
