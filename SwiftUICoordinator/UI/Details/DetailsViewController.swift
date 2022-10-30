//
//  DetailsViewController.swift
//  SwiftUICoordinator
//
//  Created by Tadas Legota on 30/10/2022.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    private let viewModel: DetailsViewModel
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: viewModel.imageName)
        return view
    }()
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = viewModel.title
        return view
    }()
    
    init(_ viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not supported")
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        NSLayoutConstraint.activate(
            imageViewConstraints() +
            labelConstraints()
        )
    }
    
    private func imageViewConstraints() -> [NSLayoutConstraint] {
        return [
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
    }
    
    private func labelConstraints() -> [NSLayoutConstraint] {
        return [
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
    }
    
    struct DetailsViewModel {
        let imageName: String
        let title: String
    }
}
