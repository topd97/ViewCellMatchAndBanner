//
//  CollectionViewWhitBanner.swift
//  ViewCellMatchAndBanner
//
//  Created by Thiago Outeiro Pereira Damasceno on 24/05/19.
//

import Foundation

public class CollectionViewWhitBanner: UICollectionView {
    var dataSourceDelegate: MatchAndBannerCollectionDataSource?
    
    public func configure(cellType: UICollectionViewCell.Type) {
        self.dataSourceDelegate = MatchAndBannerCollectionDataSource.init(view: self, cellType: cellType)
        self.dataSource = dataSourceDelegate
    }
    
    public func test(ab:Int){
        print("2")
    }
}
