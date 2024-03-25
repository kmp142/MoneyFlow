//
//  MoneyTableViewCell.swift
//  MoneyFlow
//
//  Created by Ильмир Шарафутдинов on 24.03.2024.
//

import UIKit
import Kingfisher

class MoneyTableViewCell: UITableViewCell {
    
    let url = URL(string: "https://example.com/image.png")
    
    var expenses: Expenses?
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var moneyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configureCell(with expenses: Expenses) {
        self.expenses = expenses
        nameLabel.text = expenses.title
        moneyLabel.text = expenses.secondTitle
    }
    
    func setupSubviews() {
        addSubview(nameLabel)
        addSubview(moneyLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            moneyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            moneyLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }

}
extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
