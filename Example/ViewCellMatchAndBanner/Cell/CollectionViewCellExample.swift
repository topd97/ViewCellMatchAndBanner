//
//  CollectionViewCellExample.swift
//  ViewCellMatchAndBanner_Example
//
//  Created by Thiago Outeiro Pereira Damasceno on 24/05/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class CollectionViewCellExample: UICollectionViewCell {

   
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func changeText(texto: String) -> UICollectionViewCell{
        label.text = "Sou uma Célula Normal de numero " + texto
        return self
    }

}
