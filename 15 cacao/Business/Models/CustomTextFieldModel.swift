//
//  CustomTextFieldModel.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 29.06.2022.
//

import UIKit

class CustomTextField: UITextField {
  override init(frame: CGRect) {
      super.init(frame: frame)
      self.font = UIFont(name:"Avenir Next", size: 14)
      self.placeholder = ""
      self.borderStyle = UITextField.BorderStyle.roundedRect
      self.autocorrectionType = UITextAutocorrectionType.no
      self.keyboardType = UIKeyboardType.default
      self.returnKeyType = UIReturnKeyType.done
      self.clearButtonMode = UITextField.ViewMode.whileEditing
      self.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
      self.textColor = Constants.Colors.primaryTeal
  }
  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }
}
