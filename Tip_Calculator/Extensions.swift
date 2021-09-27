//
//  Extensions.swift
//  Tip_Calculator
//
//  Created by Mathias Rettinger on 25.09.21.
//

import Foundation
import UIKit

extension UIView {
	var width: CGFloat {
		return frame.size.width
	}
	
	var height: CGFloat {
		return frame.size.height
	}
}

extension UIColor {
	class var darkGreen: UIColor {
		return UIColor(red: 5/255, green: 80/255, blue: 82/255, alpha: 1)
	}
	
	class var brightGreen: UIColor {
		return UIColor(red: 83/255, green: 184/255, blue: 187/255, alpha: 1)
		}
	
	class var textFieldBackground: UIColor {
		return UIColor(red: 243/255, green: 242/255, blue: 201/255, alpha: 1)
	}
}

class RightPaddedTextField: UITextField {
	
	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return CGRect(x: bounds.origin.x - 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
	}
	
	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return CGRect(x: bounds.origin.x - 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
	}
	
}
