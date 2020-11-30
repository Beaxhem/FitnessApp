//
//  HorizontalCollectionView.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 30.11.2020.
//

import Foundation
import UIKit

class HorizontalCollectionView: UIView {
    var data: [ItemData]?
    var cellType: Cell.Type?
    var size: ((UICollectionView) -> CGSize)?
    
    init(data: [ItemData], cellType: Cell.Type, size: @escaping (UICollectionView) -> CGSize) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.data = data
        self.cellType = cellType
        self.size = size
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(cellType as? UICollectionViewCell.Type, forCellWithReuseIdentifier: cellType.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear

        self.addSubview(collectionView)

        StickToEdges(parent: self, child: collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HorizontalCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let size = size {
            return size(collectionView)
        }
        return CGSize(width: collectionView.height / 2, height: collectionView.height / 2 - 5)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cellType = cellType {
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as? Cell
            
            cell?.data = data?[indexPath.item] ?? ItemData()

            return cell as! UICollectionViewCell
            
        }
        
        return UICollectionViewCell()
    }
}

protocol Cell {
    static var identifier: String { get }
    var data: ItemData? { get set}
}

class ItemData {
    
}
