//
//  AppCoordinator.swift
//  SwiftUICoordinator
//
//  Created by Tadas Legota on 30/10/2022.
//

import Foundation
import UIKit

class AppNavigator {
    
    private let navigationController: UINavigationController
    
    init (
        _ navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainScreen(
            MainScreenListener(self)
        ).asViewController()
        
        navigationController.setViewControllers([vc], animated: false)
    }
    
    private class MainScreenListener: MainScreenEvents {
        private let parent: AppNavigator
        
        init(_ parent: AppNavigator) {
            self.parent = parent
        }
        
        func onItemPressed(item: MainViewModel.FooItem) {
            let vc = DetailsViewController(
                DetailsViewController.DetailsViewModel(
                    imageName: item.imageName,
                    title: item.title
                )
            )
            parent.navigationController.pushViewController(vc, animated: true)
        }
    }
}
