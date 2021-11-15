//
//  ExtentedUIImageView.swift
//  homework16
//
//  Created by wictoriene on 14.11.21.
//
import UIKit

extension UIImageView {
    func makeRounded() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
