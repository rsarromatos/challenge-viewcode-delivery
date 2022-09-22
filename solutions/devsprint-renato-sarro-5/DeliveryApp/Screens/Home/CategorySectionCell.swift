//
//  CategorySectionCell.swift
//  DeliveryApp
//
//  Created by Cora on 22/09/22.
//

import UIKit

final class CategorySectionCell: UITableViewCell, ViewCodeProtocol {
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    func updateCategories(with categories: [String]) {
        setupViews()
        contentStack.addArrangedSubviews(categories.map { CategoryCell(with: $0) })
    }
    
    // MARK: View code protocol
    func configViews() {
        backgroundColor = DesignSystemColor.white.color
    }
    
    func buildViews() {
        contentView.addSubviews([scrollView])
        scrollView.addSubviews([contentStack])
    }
    
    func setupConstraints() {
        let bottomConstraint = scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bottomConstraint,
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            contentStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStack.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24)
        ])
    }
}
