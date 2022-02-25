//
//  UIView + Extension.swift
//  ToDoList
//
//  Created by Pavel Olegovich on 15.02.2022.
//

import Foundation
import UIKit

extension UIView {
    
    func createLabel(fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
}
