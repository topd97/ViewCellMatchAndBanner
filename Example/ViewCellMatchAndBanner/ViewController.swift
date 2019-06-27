//
//  ViewController.swift
//  ViewCellMatchAndBanner
//
//  Created by topd97 on 05/23/2019.
//  Copyright (c) 2019 topd97. All rights reserved.
//

import UIKit
import ViewCellMatchAndBanner

class ViewController: UICollectionViewController, MatchAndBannerCollectionViewDatasourceProtocol {

    @IBOutlet var collectionViewWhitBanner: CollectionViewWhitBanner!
    
    var collectionViewInteractor = CollectionViewWhitBannerInteractor.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewInteractor.viewControllerDelegate = self
        collectionViewInteractor.configure(view: self.collectionViewWhitBanner, cellType: CollectionViewCellExample.self)
        collectionViewInteractor.insertItensInCollectionView(itens: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19])
    }

    func setupCell(cell: UICollectionViewCell, infosOfCell: InfosOfCell) -> UICollectionViewCell {
        if let cellToSetup = cell as? CollectionViewCellExample{
            return cellToSetup.changeText(texto: String(infosOfCell.anyNumber))
        }
        return UICollectionViewCell.init()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

