//
//  MostPopularCoursesView.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 29.11.2020.
//

import Foundation
import UIKit

class MostPopularCoursesView: UIView {
    var data: [Course] = []

    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false

        getData()
        
        let collectionView = HorizontalCollectionView(data: data, cellType: SquaredCourseCell.self, size: { size in
            CGSize(width: size.height, height: size.height)
        })
            
        self.addSubview(collectionView)

        StickToEdges(parent: self, child: collectionView)
    }

    func getData() {
        self.data = Database.shared.getAllCourses()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
