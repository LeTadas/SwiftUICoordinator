//
//  MainViewModel.swift
//  SwiftUICoordinator
//
//  Created by Tadas Legota on 30/10/2022.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var state: State
    
    init(state: State = .loading) {
        self.state = state
    }
    
    struct FooItem {
        let imageName: String
        let title: String
    }
    
    enum State {
        case loading
        case success(_ : [FooItem])
    }
}
