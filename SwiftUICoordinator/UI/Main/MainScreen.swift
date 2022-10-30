//
//  MainScreen.swift
//  SwiftUICoordinator
//
//  Created by Tadas Legota on 30/10/2022.
//

import Foundation

protocol MainScreenEvents {
    func onItemPressed(item: MainViewModel.FooItem)
}

public class MainScreen: Screen {
    
    private let viewModel = MainViewModel()
    private let listener: MainScreenEvents
    
    init(_ listener: MainScreenEvents) {
        self.listener = listener
    }
    
    func createView() -> MainView {
        return MainView(
            viewModel,
            onItemPressed: { [self] item in
                listener.onItemPressed(item: item)
            }
        )
    }
    
    func onStart() {
        // Load data
        viewModel.state = .success(
            [
                MainViewModel.FooItem(imageName: "heart.fill", title: "Item 1"),
                MainViewModel.FooItem(imageName: "heart.fill", title: "Item 2"),
                MainViewModel.FooItem(imageName: "heart.fill", title: "Item 3")
            ]
        )
    }
}
