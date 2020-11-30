//
//  FamouseCoachesView.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 30.11.2020.
//

import Foundation
import UIKit

class FamousCoachesView: UIView {
    var data: [Course] = []
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        getData()
        
        let slider = HorizontalCollectionView(data: data, cellType: CoachCell.self, size: { size in
            CGSize(width: size.width / 2.5, height: size.height)
        })
        
        self.addSubview(slider)
        
        StickToEdges(parent: self, child: slider)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getData() {
        self.data = Database.shared.getAllCourses()
    }
}

