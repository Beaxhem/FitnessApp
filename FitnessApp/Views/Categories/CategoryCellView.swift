//
//  CategoryView.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 30.11.2020.
//

import Foundation
import UIKit

class CategoryCellView: UICollectionViewCell, Cell {
    static let identifier = "CategoryCellView"
    
    var data: ItemData? {
        didSet {
            if let data = data as? Category {
                title.text = data.title
                imageView.image = UIImage(named: data.imageName)
            }
        }
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        
        return imageView
    }()
    
    let title: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.sizeToFit()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)

        StickToEdges(parent: contentView, child: imageView)
        
        contentView.addSubview(title)
        
        StickToEdges(parent: contentView, child: title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
