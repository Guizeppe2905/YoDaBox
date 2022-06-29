//
//  CustomButtonModel.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 29.06.2022.
//

import UIKit

class CustomButton: UIButton {
  override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = Constants.Colors.primaryTeal
      self.layer.cornerRadius = self.frame.width / 2
      self.setTitleColor(.white, for: .normal)
      self.titleLabel?.numberOfLines = 0
      self.titleLabel?.textAlignment = .center
      self.titleLabel?.font = UIFont(name:"Avenir Next", size: 18)
  }
  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }
}

