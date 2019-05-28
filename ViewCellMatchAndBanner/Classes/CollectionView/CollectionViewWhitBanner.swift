//
//  CollectionViewWhitBanner.swift
//  ViewCellMatchAndBanner
//
//  Created by Thiago Outeiro Pereira Damasceno on 24/05/19.
//

import Foundation

public class CollectionViewWhitBanner: UICollectionView {
    public var dataSourceDelegate: MatchAndBannerCollectionDataSource?
    public var dataSOurceProtocol: MatchAndBannerCollectionViewDatasourceProtocol?
    
    
    public func configure(cellType: UICollectionViewCell.Type) {
        self.dataSourceDelegate = MatchAndBannerCollectionDataSource.init(view: self, cellType: cellType)
        self.dataSource = dataSourceDelegate
    }
    
    public func insertItensInCollectionView(itens cells: [Int]){
        var itensToInsert:[Infos] = []
        
        for item in cells {
            itensToInsert.append(Infos.init(qualquer: item))
        }
        self.dataSourceDelegate?.reloadData(with: itensToInsert)
    }
    
}
