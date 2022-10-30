//
//  SwiftUIController.swift
//  SwiftUICoordinator
//
//  Created by Tadas Legota on 30/10/2022.
//

import UIKit
import SwiftUI

extension Screen {
    
    func asViewController() -> UIViewController {
        return SwiftUIViewController(self)
    }
}

private class SwiftUIViewController<S, Content>: UIViewController where S: Screen, S.View == Content {
    
    private let screen: S
    
    init(_ screen: S) {
        self.screen = screen
        contentView = UIHostingController(
            rootView: ViewWithBackground(content: screen.createView)
        )
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not supported")
    }
    
    private let contentView: UIHostingController<ViewWithBackground<Content>>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(contentView)
        view.addSubview(contentView.view)
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        screen.onStart()
    }
    
    private func setupConstraints() {
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

private struct ViewWithBackground<Content: View>: View {
    
    @ViewBuilder let content: Content
    
    public var body: some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
    }
}
