//
//  MatchAndBannerCollectionDataSource.swift
//  ViewCellMatchAndBanner
//
//  Created by Thiago Outeiro Pereira Damasceno on 24/05/19.
//

import Foundation

public protocol MatchAndBannerCollectionViewDatasourceProtocol: UIScrollViewDelegate {
    func setupCell(cell: UICollectionViewCell, infosOfCell: InfosOfCell) -> UICollectionViewCell
}

public struct InfosOfCell{
    public var anyNumber: Int
}

enum Cells{
    case infosOfCell (_ infosOfCell: InfosOfCell)
    case banner
}

public class MatchAndBannerCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    var cells: [Cells] = []
    var infosOfCell: [InfosOfCell] = []
    
    weak var collectionView: UICollectionView!
    public weak var collectionViewDelegate: MatchAndBannerCollectionViewDatasourceProtocol?
    
    init(view collectionView:UICollectionView, cellType: UICollectionViewCell.Type) {
        super.init()
        self.cells=[]
        self.collectionView = collectionView
        self.registerCellTypes(cellType: cellType)
    }
    
    func registerCellTypes(cellType: UICollectionViewCell.Type) {
        let cellName = String(describing: cellType)
        let cellBundle = Bundle.init(for: cellType.classForCoder())
        
        let nibname = UINib(nibName: cellName, bundle: cellBundle)
        self.collectionView?.register(nibname, forCellWithReuseIdentifier: "Cell")
        
        let nibAd = UINib(nibName: "BannerCollectionViewCell", bundle: Bundle.init(for: BannerCollectionViewCell.classForCoder()))
        self.collectionView?.register(nibAd, forCellWithReuseIdentifier: "Banner")
    }
    
    private func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if case let Cells.infos(match) = cells[indexPath.item] {
//            self.collectionViewDelegate?.didSelectMove(match)
//        }
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if case let Cells.infosOfCell(infosOfCell) = cells[indexPath.item] {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            self.collectionViewDelegate?.setupCell(cell: cell, infosOfCell: infosOfCell)
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Banner", for: indexPath) as? BannerCollectionViewCell
            return cell!
        }
    }
    
    func reloadData(with cells: [InfosOfCell]) {
        self.infosOfCell = cells
        self.atualizaEnum()
        self.collectionView.reloadData()
        
    }
    
    func atualizaEnum() {
        self.cells = []
        var cellsData = infosOfCell
        var videoCount = 0
        var posBanner = 4
        
        while (!cellsData.isEmpty)
        {
            if(videoCount == posBanner) {
                videoCount = 0
                posBanner = 5
                self.cells.append(.banner)
            }
            self.cells.append(.infosOfCell(cellsData.removeFirst()))
            videoCount+=1
        }
    }
    
}
