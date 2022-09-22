//
//  RestaurantCell.swift
//  DeliveryApp
//
//  Created by Cleber Reis on 20/09/22.
//

import UIKit

class RestaurantCell: UITableViewCell {
    
    private lazy var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "restaurant-logo")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 24
        image.clipsToBounds = true
        
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel.build(style: .subheadline(weight: .semibold))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel.build(style: .footnote)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func updateCell(with restaurant: Restaurant) {
        titleLabel.text = restaurant.name
        descriptionLabel.text = restaurant.category
    }
}

extension RestaurantCell: ViewCodeProtocol {
    
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        contentView.addSubviews([icon, titleLabel, descriptionLabel])
    }
    
    func setupConstraints() {
        let bottomConstraint = icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        bottomConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            icon.heightAnchor.constraint(equalToConstant: 48),
            icon.widthAnchor.constraint(equalToConstant: 48),
            
            titleLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            descriptionLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            bottomConstraint
        ])
    }
}
