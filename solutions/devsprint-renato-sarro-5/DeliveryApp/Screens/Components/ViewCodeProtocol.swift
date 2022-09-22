//
//  ViewCodeProtocol.swift
//  DeliveryApp
//
//  Created by Cora on 19/09/22.
//

import UIKit

protocol ViewCodeProtocol {
    func configViews()
    func buildViews()
    func setupConstraints()
    func setupViews()
}

extension ViewCodeProtocol {
    func setupViews() {
        configViews()
        buildViews()
        setupConstraints()
    }
}

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach(addSubview)
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach(addArrangedSubview)
    }
}
