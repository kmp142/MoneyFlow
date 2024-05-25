//
//  CategoryCell.swift
//  MoneyFlow
//
//  Created by Dmitry on 24.03.2024.
//

import Foundation
import UIKit

class CategoryCell: UITableViewCell {

    //MARK: - Properties

    lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()

    lazy var iconImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()

    private lazy var tapGR: UITapGestureRecognizer = {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        return tapGR
    }()

    weak var delegate: CategoryCellDelegate?

    //MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconImageView)
        contentView.addSubview(categoryNameLabel)
        contentView.addGestureRecognizer(tapGR)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    //MARK: - View configuration

    func configureCell(category: Category) {
        categoryNameLabel.text = category.name
        iconImageView.image = category.image
    }

    private func setupConstraints() {

        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(28)
            make.right.equalToSuperview().offset(-8)
        }

        categoryNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(8)
            make.height.centerY.equalToSuperview()
            make.right.equalTo(iconImageView.snp.left)
        }
    }

    func setupDelegate(delegate: CategoryCellDelegate) {
        self.delegate = delegate
    }

    //MARK: - Objc targets

    @objc private func cellTapped() {
        delegate?.cellTapped()
    }
}

extension UITableViewCell {
    static var reuseIdentifire: String {
        String(describing: self)
    }
}
