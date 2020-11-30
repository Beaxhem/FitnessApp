//
//  Slider.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 29.11.2020.
//

import Foundation
import UIKit

class RecommendationsSlider: UIView {
    var data: [Course] = [Course(title: "Training by Helen McGregor", imageName: "1"), Course(title: "Test title", imageName: "2"), Course(title: "Test title", imageName: "3")]
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false

        let collectionView = HorizontalCollectionView(data: data, cellType: RecommendationCell.self, size: { collectionView in
            CGSize(width: collectionView.width - collectionView.contentInset.left - collectionView.contentInset.right, height: collectionView.height)
        })

        self.addSubview(collectionView)

        StickToEdges(parent: self, child: collectionView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
