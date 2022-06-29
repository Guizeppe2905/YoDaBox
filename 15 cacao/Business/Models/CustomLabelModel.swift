//
//  CustomLabelModel.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 29.06.2022.
//
import UIKit

class CustomLabel: UILabel {
  override init(frame: CGRect) {
      super.init(frame: frame)
      self.numberOfLines = 0
      self.font = .systemFont(ofSize: 14, weight: .semibold)
      self.textColor = Constants.Colors.primaryTeal
      self.text = ""
  }
  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }
}
