//
//  ViewController.swift
//  Tip_Calculator
//
//  Created by Mathias Rettinger on 25.09.21.
//

import UIKit

class ViewController: UIViewController {
	
	var bill:Double = 0
	var tipPercentage:Double = 0
	var numberOfPeople: Double = 1
	
	// MARK: Elements - Labels
	private let billLabel: UILabel = {
		let label = UILabel()
		label.text = "Bill"
		label.textColor = UIColor.darkGreen
		label.font = UIFont(name: "Helvetica Neue Medium", size: 20)
		label.numberOfLines = 0
		label.layer.masksToBounds = false
		return label
	}()
	
	private let selectTipLabel: UILabel = {
		let label = UILabel()
		label.text = "Select Tip %"
		label.textColor = UIColor.darkGreen
		label.font = UIFont(name: "Helvetica Neue Medium", size: 20)
		label.numberOfLines = 0
		label.layer.masksToBounds = false
		return label
	}()
	
	private let numberOfPeopleLabel: UILabel = {
		let label = UILabel()
		label.text = "Number of People"
		label.textColor = UIColor.darkGreen
		label.font = UIFont(name: "Helvetica Neue Medium", size: 20)
		label.numberOfLines = 0
		label.layer.masksToBounds = false
		return label
	}()
	
	private let tipAmountLabel: UILabel = {
		let label = UILabel()
		label.text = "Tip Amount"
		label.textColor = UIColor.white
		label.textAlignment = .center
		label.font = UIFont(name: "Helvetica Neue Bold", size: 20)
		label.numberOfLines = 0
		label.layer.masksToBounds = false
		return label
	}()
	
	private let totalLabel: UILabel = {
		let label = UILabel()
		label.text = "Total"
		label.textColor = UIColor.white
		label.textAlignment = .center
		label.font = UIFont(name: "Helvetica Neue Bold", size: 20)
		label.numberOfLines = 0
		label.layer.masksToBounds = false
		return label
	}()
	
	private let perPersonLabel: UILabel = {
		let label = UILabel()
		label.text = "per person"
		label.textColor = UIColor.white
		label.textAlignment = .center
		label.font = UIFont(name: "Helvetica Neue Thin", size: 20)
		label.numberOfLines = 0
		label.layer.masksToBounds = false
		return label
	}()
	
	private let tipAmountValueLabel: UILabel = {
		let label = UILabel()
		label.text = "$0.00"
		label.textColor = UIColor.brightGreen
		label.textAlignment = .right
		label.font = UIFont(name: "Helvetica Neue Bold", size: 30)
		label.numberOfLines = 0
		label.layer.masksToBounds = false
		return label
	}()
	
	private let totalValueLabel: UILabel = {
		let label = UILabel()
		label.text = "$0.00"
		label.textColor = UIColor.brightGreen
		label.textAlignment = .right
		label.font = UIFont(name: "Helvetica Neue Bold", size: 30)
		label.numberOfLines = 0
		label.layer.masksToBounds = false
		return label
	}()
	
	// MARK: Elements - TextFields
	private let billTextField: UITextField = {
		let imageView = UIImageView(image: UIImage(systemName: "dollarsign.circle"))
		imageView.tintColor = UIColor.darkGreen
		imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
		imageView.contentMode = .scaleAspectFit
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
		view.addSubview(imageView)
		let textField = RightPaddedTextField()
		textField.leftViewMode = .always
		textField.leftView = view
		textField.placeholder = "Type your Bill"
		textField.textColor = UIColor.darkGreen
		textField.font = UIFont(name: "Helvetica Neue", size: 20)
		textField.backgroundColor = UIColor.brightGreen
		textField.textAlignment = .right
		textField.keyboardType = .decimalPad
		textField.layer.cornerRadius = 5
		textField.layer.masksToBounds = true
		textField.addTarget(self, action: #selector(calculateTip), for: .editingChanged)
		return textField
	}()
	
	private let numberofPeopleTextField: UITextField = {
		let imageView = UIImageView(image: UIImage(systemName: "person.circle"))
		imageView.tintColor = UIColor.darkGreen
		imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
		imageView.contentMode = .scaleAspectFit
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
		view.addSubview(imageView)
		let textField = RightPaddedTextField()
		textField.leftViewMode = .always
		textField.leftView = view
		textField.text = "1"
		textField.textColor = UIColor.darkGreen
		textField.font = UIFont(name: "Helvetica Neue", size: 20)
		textField.backgroundColor = UIColor.brightGreen
		textField.textAlignment = .right
		textField.keyboardType = .decimalPad
		textField.layer.cornerRadius = 5
		textField.layer.masksToBounds = true
		textField.addTarget(self, action: #selector(calculateTip), for: .editingChanged)
		return textField
	}()
	
	// MARK: Elements - Containers
	
	private let textFieldContainer: UIView = {
		let view = UIView()
		return view
	}()
	
	private let selectTipContainer: UIView = {
		let view = UIView()
		return view
	}()
	
	private let resultContainer: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.darkGreen
		view.layer.cornerRadius = 8
		return view
	}()
	
	// MARK: Elements - Buttons
	private let fivePercentButton: UIButton = {
		let button = UIButton()
		button.setTitle("5%", for: .normal)
		button.setTitleColor(UIColor.white, for: .normal)
		button.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 30)
		button.backgroundColor = UIColor.darkGreen
		button.layer.cornerRadius = 8
		button.layer.masksToBounds = false
		button.addTarget(self, action: #selector(addFive), for: .touchUpInside)
		button.isEnabled = true
		return button
	}()
	
	private let tenPercentButton: UIButton = {
		let button = UIButton()
		button.setTitle("10%", for: .normal)
		button.setTitleColor(UIColor.white, for: .normal)
		button.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 30)
		button.backgroundColor = UIColor.darkGreen
		button.layer.cornerRadius = 8
		button.layer.masksToBounds = false
		button.addTarget(self, action: #selector(addTen), for: .touchUpInside)
		button.isEnabled = true
		return button
	}()
	
	private let fifteenPercentButton: UIButton = {
		let button = UIButton()
		button.setTitle("15%", for: .normal)
		button.setTitleColor(UIColor.white, for: .normal)
		button.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 30)
		button.backgroundColor = UIColor.darkGreen
		button.layer.cornerRadius = 8
		button.layer.masksToBounds = false
		button.addTarget(self, action: #selector(addFifteen), for: .touchUpInside)
		button.isEnabled = true
		return button
	}()
	
	private let twentyPercentButton: UIButton = {
		let button = UIButton()
		button.setTitle("20%", for: .normal)
		button.setTitleColor(UIColor.white, for: .normal)
		button.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 30)
		button.backgroundColor = UIColor.darkGreen
		button.layer.cornerRadius = 8
		button.layer.masksToBounds = false
		button.addTarget(self, action: #selector(addTwenty), for: .touchUpInside)
		button.isEnabled = true
		return button
	}()
	
	private let twentyfivePercentButton: UIButton = {
		let button = UIButton()
		button.setTitle("25%", for: .normal)
		button.setTitleColor(UIColor.white, for: .normal)
		button.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 30)
		button.backgroundColor = UIColor.darkGreen
		button.layer.cornerRadius = 8
		button.layer.masksToBounds = false
		button.addTarget(self, action: #selector(addTwentyfive), for: .touchUpInside)
		button.isEnabled = true
		return button
	}()
	
	private let customPercentButton: UIButton = {
		let button = UIButton()
		button.setTitle("Custom", for: .normal)
		button.setTitleColor(UIColor.white, for: .normal)
		button.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 30)
		button.backgroundColor = UIColor.darkGreen
		button.layer.cornerRadius = 8
		button.layer.masksToBounds = false
		button.addTarget(self, action: #selector(addCustom), for: .touchUpInside)
		button.isEnabled = true
		return button
	}()
	
	private let resetButton: UIButton = {
		let button = UIButton()
		button.setTitle("RESET", for: .normal)
		button.setTitleColor(UIColor.darkGreen, for: .normal)
		button.setTitleColor(UIColor.white, for: .highlighted)
		button.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 30)
		button.backgroundColor = UIColor.brightGreen
		button.layer.cornerRadius = 8
		button.layer.masksToBounds = false
		button.addTarget(self, action: #selector(reset), for: .touchUpInside)
		button.isEnabled = true
		return button
	}()

	// MARK: viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		setupElements()
	}
	
	// MARK: Functions - setupElements
	private func setupElements() {
		view.backgroundColor = UIColor.secondarySystemBackground

		view.addSubview(textFieldContainer)
		view.addSubview(selectTipContainer)
		view.addSubview(resultContainer)
		
		textFieldContainer.frame = CGRect(x: 20, y: view.width/8, width: view.width-40, height: view.height/6)
		selectTipContainer.frame = CGRect(x: 20, y: (view.height/4)+10, width: view.width-40, height: view.height/3)
		resultContainer.frame = CGRect(x: 20, y: (view.height/2)+view.width/4, width: view.width-40, height: view.height/3)
		
		setupTextFieldContainer()
		setupSelectTipContainer()
		setupResultContainer()
	}
	
	// MARK: Functions - setupTextFieldContainer
	private func setupTextFieldContainer() {
		textFieldContainer.addSubview(billLabel)
		textFieldContainer.addSubview(billTextField)
		textFieldContainer.addSubview(numberOfPeopleLabel)
		textFieldContainer.addSubview(numberofPeopleTextField)
		
		billLabel.frame = CGRect(x: 0, y: 0, width: textFieldContainer.width, height: textFieldContainer.height/6)
		billTextField.frame = CGRect(x: 0, y: textFieldContainer.height/4-5, width: textFieldContainer.width, height: textFieldContainer.height/3)
		numberOfPeopleLabel.frame = CGRect(x: 0, y: textFieldContainer.height/2+10, width: textFieldContainer.width, height: textFieldContainer.height/6)
		numberofPeopleTextField.frame = CGRect(x: 0, y: textFieldContainer.height/4*3+5, width: textFieldContainer.width, height: textFieldContainer.height/3)
	}
	
	// MARK: Functions - setupSelectTipContainer
	private func setupSelectTipContainer() {
		selectTipContainer.addSubview(selectTipLabel)
		selectTipContainer.addSubview(fivePercentButton)
		selectTipContainer.addSubview(tenPercentButton)
		selectTipContainer.addSubview(fifteenPercentButton)
		selectTipContainer.addSubview(twentyPercentButton)
		selectTipContainer.addSubview(twentyfivePercentButton)
		selectTipContainer.addSubview(customPercentButton)
		
		selectTipLabel.frame = CGRect(x: 0, y: 0, width: selectTipContainer.width, height: selectTipContainer.height/8)
		fivePercentButton.frame = CGRect(x: 0, y: selectTipContainer.height/8, width: selectTipContainer.width/2-5, height: selectTipContainer.height/3.5-10)
		tenPercentButton.frame = CGRect(x: selectTipContainer.width/2, y: selectTipContainer.height/8, width: selectTipContainer.width/2, height: selectTipContainer.height/3.5-10)
		fifteenPercentButton.frame = CGRect(x: 0, y: selectTipContainer.height/2.5, width: selectTipContainer.width/2-5, height: selectTipContainer.height/3.5-10)
		twentyPercentButton.frame = CGRect(x: selectTipContainer.width/2, y: selectTipContainer.height/2.5, width: selectTipContainer.width/2, height: selectTipContainer.height/3.5-10)
		twentyfivePercentButton.frame = CGRect(x: 0, y: selectTipContainer.height-selectTipContainer.height/3+2, width: selectTipContainer.width/2-5, height: selectTipContainer.height/3.5-10)
		customPercentButton.frame = CGRect(x: selectTipContainer.width/2, y: selectTipContainer.height-selectTipContainer.height/3+2, width: selectTipContainer.width/2, height: selectTipContainer.height/3.5-10)
	}
	
	// MARK: Functions - setupResultContainer
	private func setupResultContainer() {
		resultContainer.addSubview(perPersonLabel)
		resultContainer.addSubview(tipAmountLabel)
		resultContainer.addSubview(tipAmountValueLabel)
		resultContainer.addSubview(totalLabel)
		resultContainer.addSubview(totalValueLabel)
		resultContainer.addSubview(resetButton)
		
		perPersonLabel.frame = CGRect(x: resultContainer.width/3, y: 0, width: resultContainer.width/3, height: 20)
		tipAmountLabel.frame = CGRect(x: 10, y: resultContainer.height/4, width: resultContainer.width/2-20, height: 30)
		tipAmountValueLabel.frame = CGRect(x: resultContainer.width/2, y: resultContainer.height/4, width: resultContainer.width/2-10, height: 30)
		totalLabel.frame = CGRect(x: 10, y: resultContainer.height/2, width: resultContainer.width/2-20, height: 30)
		totalValueLabel.frame = CGRect(x: resultContainer.width/2, y: resultContainer.height/2, width: resultContainer.width/2-10, height: 30)
		resetButton.frame = CGRect(x: 10, y: resultContainer.height-resultContainer.height/6-10, width: resultContainer.width-20, height: resultContainer.height/6)
	}
	
	// MARK: Functions - alertEmptyTextField
	private func alertEmptyTextField() {
		let alert = UIAlertController(title: "Warning!", message: "The Fields must be filled", preferredStyle: .alert)
		
		let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
		
		alert.addAction(action)
		
		present(alert, animated: true, completion: nil)
	}
	
	// MARK: @objc Functions - calculateTip
	@objc private func calculateTip() {
		if let convertedBill = Double(billTextField.text!) {
			if let convertedNumberOfPeople = Double(numberofPeopleTextField.text!) {
				numberOfPeople = convertedNumberOfPeople
				bill = convertedBill
				
				let tipResult = (bill*tipPercentage)/numberOfPeople
				let totalResult = (bill/numberOfPeople)+tipResult
				
				tipAmountValueLabel.text = "$\(String(format: "%.2f", tipResult))"
				totalValueLabel.text = "$\(String(format: "%.2f", totalResult))"
			}
		}
	}
	
	// MARK: @objc Functions - addFive
	@objc private func addFive() {
		if numberofPeopleTextField.text!.isEmpty || billTextField.text!.isEmpty {
			alertEmptyTextField()
		} else {
			fivePercentButton.backgroundColor = UIColor.brightGreen
			fivePercentButton.setTitleColor(UIColor.darkGreen, for: .normal)
			
			tenPercentButton.backgroundColor = UIColor.darkGreen
			tenPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			fifteenPercentButton.backgroundColor = UIColor.darkGreen
			fifteenPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			twentyPercentButton.backgroundColor = UIColor.darkGreen
			twentyPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			twentyfivePercentButton.backgroundColor = UIColor.darkGreen
			twentyfivePercentButton.setTitleColor(UIColor.white, for: .normal)
			
			customPercentButton.backgroundColor = UIColor.darkGreen
			customPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			tipPercentage = 0.05
			calculateTip()
		}
	}
	
	// MARK: @objc Functions - addTen
	@objc private func addTen() {
		if numberofPeopleTextField.text!.isEmpty || billTextField.text!.isEmpty {
			alertEmptyTextField()
		} else {
			tenPercentButton.backgroundColor = UIColor.brightGreen
			tenPercentButton.setTitleColor(UIColor.darkGreen, for: .normal)
			
			fifteenPercentButton.backgroundColor = UIColor.darkGreen
			fifteenPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			fivePercentButton.backgroundColor = UIColor.darkGreen
			fivePercentButton.setTitleColor(UIColor.white, for: .normal)
			
			twentyPercentButton.backgroundColor = UIColor.darkGreen
			twentyPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			twentyfivePercentButton.backgroundColor = UIColor.darkGreen
			twentyfivePercentButton.setTitleColor(UIColor.white, for: .normal)
			
			customPercentButton.backgroundColor = UIColor.darkGreen
			customPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			tipPercentage = 0.1
			calculateTip()
		}
	}
	
	// MARK: @objc Functions - addFifteen
	@objc private func addFifteen() {
		if numberofPeopleTextField.text!.isEmpty || billTextField.text!.isEmpty {
			alertEmptyTextField()
		} else {
			fifteenPercentButton.backgroundColor = UIColor.brightGreen
			fifteenPercentButton.setTitleColor(UIColor.darkGreen, for: .normal)
			
			tenPercentButton.backgroundColor = UIColor.darkGreen
			tenPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			fivePercentButton.backgroundColor = UIColor.darkGreen
			fivePercentButton.setTitleColor(UIColor.white, for: .normal)
			
			twentyPercentButton.backgroundColor = UIColor.darkGreen
			twentyPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			twentyfivePercentButton.backgroundColor = UIColor.darkGreen
			twentyfivePercentButton.setTitleColor(UIColor.white, for: .normal)
			
			customPercentButton.backgroundColor = UIColor.darkGreen
			customPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			tipPercentage = 0.15
			calculateTip()
		}
	}
	
	// MARK: @objc Functions - addTwenty
	@objc private func addTwenty() {
		if numberofPeopleTextField.text!.isEmpty || billTextField.text!.isEmpty {
			alertEmptyTextField()
		} else {
			twentyPercentButton.backgroundColor = UIColor.brightGreen
			twentyPercentButton.setTitleColor(UIColor.darkGreen, for: .normal)
			
			tenPercentButton.backgroundColor = UIColor.darkGreen
			tenPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			fivePercentButton.backgroundColor = UIColor.darkGreen
			fivePercentButton.setTitleColor(UIColor.white, for: .normal)
			
			twentyfivePercentButton.backgroundColor = UIColor.darkGreen
			twentyfivePercentButton.setTitleColor(UIColor.white, for: .normal)
			
			fifteenPercentButton.backgroundColor = UIColor.darkGreen
			fifteenPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			customPercentButton.backgroundColor = UIColor.darkGreen
			customPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			tipPercentage = 0.20
			calculateTip()
		}
	}
	
	// MARK: @objc Functions - addTwentyfive
	@objc private func addTwentyfive() {
		if numberofPeopleTextField.text!.isEmpty || billTextField.text!.isEmpty {
			alertEmptyTextField()
		} else {
			twentyfivePercentButton.backgroundColor = UIColor.brightGreen
			twentyfivePercentButton.setTitleColor(UIColor.darkGreen, for: .normal)
			
			tenPercentButton.backgroundColor = UIColor.darkGreen
			tenPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			fifteenPercentButton.backgroundColor = UIColor.darkGreen
			fifteenPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			fivePercentButton.backgroundColor = UIColor.darkGreen
			fivePercentButton.setTitleColor(UIColor.white, for: .normal)
			
			twentyPercentButton.backgroundColor = UIColor.darkGreen
			twentyPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			customPercentButton.backgroundColor = UIColor.darkGreen
			customPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			tipPercentage = 0.25
			calculateTip()
		}
	}
	
	// MARK: @objc Functions - addCustom
	@objc private func addCustom() {
		if numberofPeopleTextField.text!.isEmpty || billTextField.text!.isEmpty {
			alertEmptyTextField()
		} else {
			customPercentButton.backgroundColor = UIColor.brightGreen
			customPercentButton.setTitleColor(UIColor.darkGreen, for: .normal)
			
			fifteenPercentButton.backgroundColor = UIColor.darkGreen
			fifteenPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			tenPercentButton.backgroundColor = UIColor.darkGreen
			tenPercentButton.setTitleColor(UIColor.white, for: .normal)
			
			fivePercentButton.backgroundColor = UIColor.darkGreen
			fivePercentButton.setTitleColor(UIColor.white, for: .normal)
			
			let alert = UIAlertController(title: "Tip Percent", message: "", preferredStyle: .alert)
			
			var customTipTextField = UITextField()
			
			let action = UIAlertAction(title: "Done", style: .default) { action in
				self.tipPercentage = Double(customTipTextField.text!)!
				self.calculateTip()
			}
			
			let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { cancelAction in }
			
			alert.addTextField { textField in
				customTipTextField = textField
				customTipTextField.placeholder = "Example(1% = 0.01, 10% = 0.10)"
				customTipTextField.keyboardType = .decimalPad
			}
			
			alert.addAction(cancelAction)
			alert.addAction(action)
			
			present(alert, animated: true, completion: nil)
		}
	}
	
	// MARK: @objc Functions - reset
	@objc private func reset() {
		billTextField.text = ""
		numberofPeopleTextField.text = "1"
		numberOfPeople = 1
		tipPercentage = 0
		tipAmountValueLabel.text = "$0.00"
		totalValueLabel.text = "$0.00"
		
		fivePercentButton.backgroundColor = UIColor.darkGreen
		fivePercentButton.setTitleColor(UIColor.white, for: .normal)
		
		tenPercentButton.backgroundColor = UIColor.darkGreen
		tenPercentButton.setTitleColor(UIColor.white, for: .normal)
		
		fifteenPercentButton.backgroundColor = UIColor.darkGreen
		fifteenPercentButton.setTitleColor(UIColor.white, for: .normal)
		
		twentyPercentButton.backgroundColor = UIColor.darkGreen
		twentyPercentButton.setTitleColor(UIColor.white, for: .normal)
		
		twentyfivePercentButton.backgroundColor = UIColor.darkGreen
		twentyfivePercentButton.setTitleColor(UIColor.white, for: .normal)
		
		customPercentButton.backgroundColor = UIColor.darkGreen
		customPercentButton.setTitleColor(UIColor.white, for: .normal)
	}
}
