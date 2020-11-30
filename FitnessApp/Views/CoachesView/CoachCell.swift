//
//  CoachCell.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 30.11.2020.
//

import Foundation
import UIKit

class CoachCell: UICollectionViewCell, Cell {
    static let identifier = "CoachCell"
    
    var data: ItemData? {
        didSet {
            if let data = data as? Course {
                title.text = data.title
                subtitle.text = "\(String(data.length)) min - Easy"
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
        label.textAlignment = .left
        label.contentMode = .bottomLeft
        label.sizeToFit()
        
        return label
    }()

    let subtitle: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 11, weight: .light)
        label.textColor = .white

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(imageView)

        StickToEdges(parent: contentView, child: imageView)

        contentView.addSubview(subtitle)

        NSLayoutConstraint.activate([
            subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            subtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            subtitle.heightAnchor.constraint(equalToConstant: 20)
        ])

        contentView.addSubview(title)

        NSLayoutConstraint.activate([
            title.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: -2),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10)
        ])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

