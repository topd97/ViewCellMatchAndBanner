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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionViewWhitBanner.dataSourceDelegate = self
        collectionViewWhitBanner.configure(cellType: CollectionViewCellExample.self)
        collectionViewWhitBanner.insertItensInCollectionView(itens: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19])
//        collectionView.configure(cellType: BannerCollectionViewCell.self)
//        collectionView.insertItensInCollectionView(itens: [celula1,celula2,celula3,celula4,celula5])
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupCell(cell: UICollectionViewCell, infos: Infos) -> UICollectionViewCell {
        if let cellToSetup = cell as? CollectionViewCellExample{
            return cellToSetup.changeText(texto: String(infos.qualquer))
        }
        return UICollectionViewCell.init()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

