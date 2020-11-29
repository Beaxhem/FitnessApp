//
//  MostPopularCoursesView.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 29.11.2020.
//

import Foundation
import UIKit

class MostPopularCoursesView: UIView {
    var data: [Course] = [Course(title: "Training by Helen McGregor", imageName: "1"), Course(title: "Test title", imageName: "2"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"),Course(title: "Training by Helen McGregor", imageName: "1"), Course(title: "Test title", imageName: "2"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"),Course(title: "Training by Helen McGregor", imageName: "1"), Course(title: "Test title", imageName: "2"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3")]
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(SquaredCourseCell.self, forCellWithReuseIdentifier: SquaredCourseCell.identifier)
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

extension MostPopularCoursesView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.height, height: collectionView.height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SquaredCourseCell.identifier, for: indexPath) as! SquaredCourseCell
        
        cell.data = data[indexPath.item]
        
        return cell
    }
}