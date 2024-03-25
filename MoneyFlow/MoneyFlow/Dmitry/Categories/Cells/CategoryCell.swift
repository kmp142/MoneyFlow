//
//  CategoryCell.swift
//  MoneyFlow
//
//  Created by Dmitry on 24.03.2024.
//

import Foundation
import UIKit

class CategoryCell: UITableViewCell {

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    lazy var iconImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()

    // The cell represents a button
    lazy var button: UIButton = {
        let button = UIButton(configuration: .plain())
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        button.addSubview(iconImageView)
        button.addSubview(nameLabel)
        setupConstraints()
    }

    func configureCell(category: Category) {
        nameLabel.text = category.name
        iconImageView.image = category.image
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupConstraints() {
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(button.snp.height).inset(2)
            make.right.equalToSuperview().inset(8)
        }

        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(8)
            make.width.height.equalTo(button.snp.height)
            make.centerY.equalToSuperview()
        }
    }
}

extension UITableViewCell {
    static var reuseIdentifire: String {
        String(describing: self)
    }
}
