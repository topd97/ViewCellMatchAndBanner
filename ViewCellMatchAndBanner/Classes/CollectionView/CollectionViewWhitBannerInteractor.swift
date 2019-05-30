//
//  CollectionViewWhitBannerInteractor.swift
//  Pods-ViewCellMatchAndBanner_Example
//
//  Created by Thiago Outeiro Pereira Damasceno on 30/05/19.
//

import Foundation
public class CollectionViewWhitBannerInteractor{

    public var dataSourceDelegate: MatchAndBannerCollectionDataSource?
    public var dataSOurceProtocol: MatchAndBannerCollectionViewDatasourceProtocol?

    public init(){
        //DO NOTHING
    }
    
    public func configure(view: UICollectionView ,cellType: UICollectionViewCell.Type) {
        self.dataSourceDelegate = MatchAndBannerCollectionDataSource.init(view: view, cellType: cellType)
        view.dataSource = dataSourceDelegate
    }

    public func insertItensInCollectionView(itens cells: [Int]){
        var itensToInsert:[Infos] = []
        
        for item in cells {
            itensToInsert.append(Infos.init(qualquer: item))
        }
        self.dataSourceDelegate?.reloadData(with: itensToInsert)
    }
}
