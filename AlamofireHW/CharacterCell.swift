//
//  CharacterCell.swift
//  AlamofireHW
//
//  Created by Виталий Таран on 15.08.2022.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "characterCell"
    
    // MARK: - UI Elements
    
    private lazy var cellStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    private func commonInit() {
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    // MARK: - Configuration
    
    private func setupHierarchy() {
        addSubview(cellStack)
        cellStack.addArrangedSubview(characterNameLabel)
        cellStack.addArrangedSubview(descriptionLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            cellStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cellStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cellStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cellStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    private func setupView() {
        
    }
    
    func configure(with model: Character) {
        characterNameLabel.text = model.name
        
        if let description = model.description, description != "" {
            descriptionLabel.text = description
        } else {
            descriptionLabel.isHidden = true
        }
        
    }
}
