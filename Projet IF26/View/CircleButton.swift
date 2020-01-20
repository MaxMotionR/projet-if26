//
//  CircleButton.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 20/01/2020.
//  Copyright © 2020 Maximilien Regnier. All rights reserved.
//

import UIKit

class CircleButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        addCornerRadius()
    }

    private func addCornerRadius() {
        layer.cornerRadius = bounds.width / 2
    }
}
