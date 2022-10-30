//
//  MainView.swift
//  SwiftUICoordinator
//
//  Created by Tadas Legota on 30/10/2022.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    private let onItemPressed: (MainViewModel.FooItem) -> Void
    
    init(
        _ viewModel: MainViewModel,
        onItemPressed: @escaping (MainViewModel.FooItem) -> Void
    ) {
        self.viewModel = viewModel
        self.onItemPressed = onItemPressed
    }
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .success(let items):
            List {
                ForEach(Array(items.enumerated()), id: \.offset) { _, item in
                    ItemView(item: item)
                        .onTapGesture {
                            onItemPressed(item)
                        }
                }
            }
        }
    }
}

struct ItemView: View {
    
    let item: MainViewModel.FooItem
    
    var body: some View {
        HStack {
            Image(systemName: item.imageName)
            
            Text(item.title)
            
            Spacer()
        }
    }
}
