//
//  ViewController.swift
//  UpMoney
//
//  Created by Dulin Gleb on 28.2.24..
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
    func setupInitialState(segments: [TransactionType])
    func setupKeyboardPadDelegate(delegate: KeyboardNumberDelegate)
    func updateAccountButton(account: Categorieble?, hasArrow: Bool)
    func updateAmountLabel(amount: String, color: UIColor)
}

final class MainViewController: UIViewController {
    private let heightBottomBtnStack = 50.0
    
    var viewModel: MainViewModelProtocol?
    
    let keyboardPadCollectionView: KeyboardPadView = {
        let kb = KeyboardPadConfigurator.instatiateModule()
        kb.translatesAutoresizingMaskIntoConstraints = false
        return kb
    }()
    
    let calendarButton: IconCircleButton = {
        let btn = IconCircleButton(type: .custom)
        btn.configure(icon: .calendar)
        return btn
    }()
    
    let commentButton: IconCircleButton = {
        let btn = IconCircleButton(type: .custom)
        btn.configure(icon: .edit)
        return btn
    }()
    
    let addTransactionButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .capsule
        let btn = UIButton(type: .custom)
        btn.configuration = configuration
        
        btn.setTitle("Add", for: .normal)
        btn.titleLabel?.font = AppStyles.Font.standartButton
        
        btn.isEnabled = false
        return btn
    }()
    
    let bottomBtnStackView: UIStackView = {
        let botBtnStackView = UIStackView()
        botBtnStackView.axis = .horizontal
        botBtnStackView.spacing = AppStyles.Layout.m10
        botBtnStackView.alignment = .fill
        botBtnStackView.distribution = .fill
        botBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return botBtnStackView
    }()
    
    let accountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = AppStyles.Layout.m10
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let amountLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 70, weight: .medium)
        lbl.textAlignment = .center
        lbl.textColor = .opaqueSeparator
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let chooseAccauntButton: DropDownButton = DropDownButton()
    
    let transactionTypeSegment: CapsulSegmentedControl = {
        let segment = CapsulSegmentedControl()
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    lazy var choseIncomeButton: DropDownButton = DropDownButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        viewModel?.viewLoaded()

    }
    
    private func setupViews() {
        bottomBtnStackView.addArrangedSubview(calendarButton)
        bottomBtnStackView.addArrangedSubview(addTransactionButton)
        bottomBtnStackView.addArrangedSubview(commentButton)
        
        chooseAccauntButton.setRightArrow()
        chooseAccauntButton.setLeftImage(leftImage: .calendar, tintColor: .systemBlue)
        chooseAccauntButton.setTitle("Category", for: .normal)
        accountStackView.addArrangedSubview(chooseAccauntButton)
        
        amountLabel.text = "$0"
        
        view.addSubview(bottomBtnStackView)
        view.addSubview(keyboardPadCollectionView)
        view.addSubview(accountStackView)
        view.addSubview(amountLabel)
        view.addSubview(transactionTypeSegment)
        
        transactionTypeSegment.addTarget(self, action: #selector(self.transactionTypeSegmentChanged(_:)), for: .valueChanged)
    }
    
    @objc func transactionTypeSegmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case TransactionType.expense.index: print("expense")
            case TransactionType.income.index: print("income")
            case TransactionType.transfer.index: print("transfer")
        default:
            return
        }
    }
}

extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bottomBtnStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:  -AppStyles.Layout.m20),
            bottomBtnStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  AppStyles.Layout.m36),
            bottomBtnStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -AppStyles.Layout.m36),
            bottomBtnStackView.heightAnchor.constraint(equalToConstant: heightBottomBtnStack),
            
            keyboardPadCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keyboardPadCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -AppStyles.Layout.m36),
            keyboardPadCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppStyles.Layout.m36),
            keyboardPadCollectionView.heightAnchor.constraint(equalToConstant: 218),
            keyboardPadCollectionView.bottomAnchor.constraint(equalTo: bottomBtnStackView.topAnchor, constant: -AppStyles.Layout.m20),
            
            accountStackView.bottomAnchor.constraint(equalTo: keyboardPadCollectionView.topAnchor, constant: -AppStyles.Layout.m20),
            accountStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppStyles.Layout.m36),
            accountStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -AppStyles.Layout.m36),
            
            amountLabel.bottomAnchor.constraint(equalTo: accountStackView.topAnchor, constant: -AppStyles.Layout.m36),
            amountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -AppStyles.Layout.m36),
            amountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppStyles.Layout.m36),
            amountLabel.heightAnchor.constraint(equalToConstant: 70),
            
            transactionTypeSegment.bottomAnchor.constraint(equalTo: amountLabel.topAnchor, constant: -AppStyles.Layout.m36),
            transactionTypeSegment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppStyles.Layout.m36),
            transactionTypeSegment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -AppStyles.Layout.m36),
        ])
    }
}

extension MainViewController: MainViewControllerProtocol {
    func setupKeyboardPadDelegate(delegate: KeyboardNumberDelegate) {
        self.keyboardPadCollectionView.viewModel?.delegate = delegate
    }
    
    func setupInitialState(segments: [TransactionType]) {
        segments.forEach { s in
            transactionTypeSegment.insertSegment(withTitle: s.title, at: s.index, animated: false)
        }
        transactionTypeSegment.selectedSegmentIndex = TransactionType.expense.index
    }
    
    func updateAccountButton(account: Categorieble?, hasArrow: Bool = true) {
        chooseAccauntButton.configure(category: account, hasArrow: hasArrow)
    }
    
    func updateAmountLabel(amount: String, color: UIColor = .cBlack) {
        amountLabel.text = amount
        amountLabel.textColor = color
    }
}
