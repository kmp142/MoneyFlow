//
//  AddOperationView.swift
//  MoneyFlow
//
//  Created by Dmitry on 24.03.2024.
//

import Foundation
import UIKit
import SnapKit

protocol CategoryCellDelegate: AnyObject {
    func cellTapped()
}

class AddOperationView: UIView {
    
    //MARK: - Properties
    
    private lazy var operationTypeSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "Доход", at: 0, animated: true)
        sc.insertSegment(withTitle: "Расход", at: 1, animated: true)
        sc.selectedSegmentIndex = 1
        sc.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        return sc
    }()
    
    private lazy var quantityTF: UITextField = {
        let tf = UITextField()
        tf.textAlignment = .right
        tf.backgroundColor = .clear
        tf.addTarget(self, action: #selector(quantityTFChanged), for: .editingChanged)
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.keyboardType = .numberPad
        tf.accessibilityIdentifier = "quantityTextField"
        return tf
    }()
    
    private lazy var viewForFocusOnTextField: UIView = {
        let view = UIView()
        view.addGestureRecognizer(inputAreaTapGR)
        return view
    }()
    
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "- 0 ₽"
        label.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        label.textAlignment = .right
        return label
    }()
    
    private var currentOperationType: OperationType = .expense
    
    private lazy var dismissViewButton: UIButton = {
        let action = UIAction { _ in
            self.controller?.dismissScreen(animated: true)
        }
        let button = UIButton(primaryAction: action)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .orange
        return button
    }()
    
    private lazy var confirmOperationButton: UIButton = {
        configureConfirmButton()
    }()
    
    lazy var categoryCell: CategoryCell = CategoryCell(style: .default, reuseIdentifier: CategoryCell.reuseIdentifire)
    
    weak var controller: AddOperationVCInterface?
    
    private lazy var inputAreaTapGR = UITapGestureRecognizer(target: self, action: #selector(inputAreaTapped))
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubviewsToMainView(subviews: operationTypeSegmentedControl, dismissViewButton, confirmOperationButton, quantityTF, quantityLabel, viewForFocusOnTextField, categoryCell)
        let category = Category(id: UUID(), name: "Категория", image: UIImage(named: "categories")!, subcategories: [])
        categoryCell.configureCell(category: category)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View configuration
    
    func setDelegation(controller: AddOperationVCInterface) {
        self.controller = controller
        if let controller = controller as? CategoryCellDelegate {
            self.categoryCell.setupDelegate(delegate: controller)
        }
    }
    
    private func setupConstraints() {
        
        operationTypeSegmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(8)
            make.width.equalTo(150)
        }
        
        dismissViewButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerY.equalTo(operationTypeSegmentedControl.snp.centerY)
            make.left.equalToSuperview().inset(8)
        }
        
        confirmOperationButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerY.equalTo(operationTypeSegmentedControl.snp.centerY)
            make.right.equalToSuperview().inset(8)
        }
        
        quantityLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(8)
            make.height.equalTo(40)
            make.top.equalTo(operationTypeSegmentedControl.snp.bottom).offset(8)
        }
        
        quantityTF.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(8)
            make.height.equalTo(24)
            make.top.equalTo(quantityLabel.snp.bottom)
        }
        
        viewForFocusOnTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(8)
            make.height.equalTo(64)
            make.top.equalTo(quantityLabel.snp.top)
        }
        
        categoryCell.snp.makeConstraints { make in
            make.top.equalTo(viewForFocusOnTextField.snp.bottom)
            make.left.right.equalToSuperview().inset(8)
            make.height.equalTo(40)
        }
    }
    
    private func configureConfirmButton() -> UIButton {
        let action = UIAction { _ in
            self.controller?
                .submitOperation(type: self.currentOperationType,
                                 quantity: Double(self.quantityTF.text ?? "0") ?? 0)
        }
        let button = UIButton(primaryAction: action)
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.tintColor = .orange
        return button
    }
    
    private func addSubviewsToMainView(subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
    //MARK: - Objc targets
    
    @objc private func inputAreaTapped() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if !self.quantityTF.isFirstResponder {
                self.quantityTF.becomeFirstResponder()
            } else {
                self.quantityTF.resignFirstResponder()
            }
        }
    }
    
    @objc private func quantityTFChanged() {
        DispatchQueue.main.async { [weak self] in
            var resultString = ""
            if self?.currentOperationType == .expense {
                resultString += "- "
            } else if self?.currentOperationType == .income {
                resultString += "+ "
            }
            
            if let text = self?.quantityTF.text, text != "" {
                resultString += text
            } else {
                resultString += "0"
            }
            resultString += " ₽"
            self?.quantityLabel.text = resultString
        }
        
    }
    
    @objc private func segmentedControlValueChanged() {
        switch operationTypeSegmentedControl.selectedSegmentIndex {
        case 0:
            currentOperationType = .income
            quantityTFChanged()
            break
        case 1:
            currentOperationType = .expense
            quantityTFChanged()
            break
        default: break
        }
    }
}

