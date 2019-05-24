//
//  MatchAndBannerCollectionDataSource.swift
//  ViewCellMatchAndBanner
//
//  Created by Thiago Outeiro Pereira Damasceno on 24/05/19.
//

import Foundation

protocol MatchAndBannerCollectionViewDatasourceDelegate: UIScrollViewDelegate {
    func didSelectMove(_ cell: UICollectionViewCell)
}

enum Cells{
    case match (_ match: UICollectionViewCell)
    case banner
}

public class MatchAndBannerCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    var cells: [Cells] = []
    
    weak var collectionView: UICollectionView!
    weak var collectionViewDelegate: MatchAndBannerCollectionViewDatasourceDelegate?
    
    
    
    init(view collectionView:UICollectionView, cellType: UICollectionViewCell.Type) {
        super.init()
        
        self.cells=[]
        self.collectionView = collectionView
        
        self.registerCells(cellType: cellType)
    }
    
    func registerCells(cellType: UICollectionViewCell.Type) {
        let cellName = String(describing: cellType)
        let cellBundle = Bundle.init(for: cellType.classForCoder())
        
        let nibname = UINib(nibName: cellName, bundle: cellBundle)
        self.collectionView?.register(nibname, forCellWithReuseIdentifier: "Cell")
        
        let nibAd = UINib(nibName: "BannerCollectionViewCell", bundle: cellBundle)
        self.collectionView?.register(nibAd, forCellWithReuseIdentifier: "Banner")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if case let Cells.match(match) = cells[indexPath.item] {
            self.collectionViewDelegate?.didSelectMove(match)
        }
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if case let Cells.match(match) = cells[indexPath.item] {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Banner", for: indexPath)
            return cell
        }
    }
    
    func reloadData(with cells: [UICollectionViewCell]) {
        self.atualizaEnum(cells: cells)
        self.collectionView.reloadData()
        
    }
    
    func atualizaEnum(cells: [UICollectionViewCell]) {
        self.cells = []
        var cellsData = cells
        var videoCount = 0
        var posBanner = 4
        
        while (!cellsData.isEmpty)
        {
            self.cells.append(.match(cellsData.removeFirst()))
            videoCount+=1
            if(videoCount == posBanner) {
                videoCount = 0
                posBanner = 5
                self.cells.append(.banner)
            }
        }
    }
    
}
