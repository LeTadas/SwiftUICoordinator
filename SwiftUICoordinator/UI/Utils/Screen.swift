//
//  Screen.swift
//  SwiftUICoordinator
//
//  Created by Tadas Legota on 30/10/2022.
//

import SwiftUI

protocol Screen {
    associatedtype View: SwiftUI.View
    
    @ViewBuilder
    func createView() -> View
    
    func onStart()
}
