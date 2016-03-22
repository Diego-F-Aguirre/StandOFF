//
//  ViewMaterial.swift
//  Clique
//
//  Created by Diego Aguirre on 3/21/16.
//  Copyright © 2016 Diego Aguirre. All rights reserved.
//

import UIKit

class ViewMaterial: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = 115
        layer.backgroundColor = UIColor(red:1.000, green:0.827, blue:0.176, alpha:1.00).CGColor
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }


}



