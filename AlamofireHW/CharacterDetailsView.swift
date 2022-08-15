//
//  CharacterDetailsView.swift
//  AlamofireHW
//
//  Created by Виталий Таран on 15.08.2022.
//

import UIKit

class CharacterDetailsView: UIView {
    
    // MARK: - UI Elements
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var imageActivityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    // MARK: - Configuration
    
    private func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(characterImageView)
        stackView.addArrangedSubview(characterNameLabel)
        characterImageView.addSubview(imageActivityIndicator)
        addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.6),
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            imageActivityIndicator.centerXAnchor.constraint(equalTo: characterImageView.centerXAnchor),
            imageActivityIndicator.centerYAnchor.constraint(equalTo: characterImageView.centerYAnchor)
        ])
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    func configureView(with model: Character) {
        self.imageActivityIndicator.startAnimating()
        DispatchQueue.main.async {
            guard let imageUrl = URL(string: model.thumbnail.path + "." + model.thumbnail.ext), let imageData = try? Data(contentsOf: imageUrl) else { return }
            self.characterNameLabel.text = model.name
            self.characterImageView.image = UIImage(data: imageData)
            self.imageActivityIndicator.stopAnimating()
        }
    }
}
