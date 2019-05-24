//
//  ViewController.swift
//  ViewCellMatchAndBanner
//
//  Created by topd97 on 05/23/2019.
//  Copyright (c) 2019 topd97. All rights reserved.
//

import UIKit
import ViewCellMatchAndBanner

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: CollectionViewWhitBanner!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.configure(cellType: BannerCollectionViewCell.self)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

