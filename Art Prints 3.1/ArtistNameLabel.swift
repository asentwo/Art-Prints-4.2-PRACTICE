//
//  ArtistNameLabel.swift
//  Art Prints 3.1
//
//  Created by Justin Doo on 8/1/15.
//  Copyright (c) 2015 Justin Doo. All rights reserved.
//

import UIKit

class ArtistNameLabel: UILabel {
    
    override func drawRect(rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 5.0, bottom: 0.0, right: 5.0)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }

}
