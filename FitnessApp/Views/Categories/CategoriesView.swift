//
//  CategoriesView.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 30.11.2020.
//

import Foundation
import UIKit

class CategoriesView: UIView {
    var data: [Category] = [Category(), Category(), Category(), Category(), Category(), Category(), Category(), Category(), Category(), Category(), Category(), Category(),]
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let collectionView = HorizontalCollectionView(data: data, cellType: CategoryCellView.self, size: {size in
            CGSize(width: size.height / 2, height: size.height / 2 - 5)
        })

        self.addSubview(collectionView)

        StickToEdges(parent: self, child: collectionView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


