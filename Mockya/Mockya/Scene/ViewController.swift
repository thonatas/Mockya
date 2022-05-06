//
//  ViewController.swift
//  Mockya
//
//  Created by Thonatas Borges on 5/6/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Views
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Constants and Variables
    private var viewModel: ViewModel?
    
    // MARK: - Initializers
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle View
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        buildViewHierarchy()
        setupConstraints()
    }
}

// MARK: - Constraints
private extension ViewController {
    func buildViewHierarchy() {
        view.addSubview(label)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

// MARK: - View Model Delegates
extension ViewController: ViewModelDelegate {
    func didGetData(_ data: String) {
        print(#function)
    }
}

