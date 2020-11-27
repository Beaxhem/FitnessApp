//
//  ViewController.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 12.11.2020.
//

import UIKit

class ViewController: UIViewController {
    var data: [Course] = [Course(title: "Training by Helen McGregor", imageName: "1"), Course(title: "Test title", imageName: "2"), Course(title: "Test title", imageName: "3")]
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()

        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let recommendations: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(CourseCell.self, forCellWithReuseIdentifier: CourseCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    let mostPopular: UILabel = {
        let view = UILabel()
        
        view.text = "Most popular"
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let categories: UILabel = {
        let view = UILabel()
        
        view.text = "Categories"
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let coaches: UILabel = {
        let view = UILabel()
        
        view.text = "Coaches"
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let coursesView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(CourseCell.self, forCellWithReuseIdentifier: CourseCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.title = "Discover"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        let recommendationsHeader: UILabel = getHeader(text: "Recommended for you")
        contentView.addSubview(recommendationsHeader)
        NSLayoutConstraint.activate([
            recommendationsHeader.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            recommendationsHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            recommendationsHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
        
        
        
        
        contentView.addSubview(recommendations)
        NSLayoutConstraint.activate([
            recommendations.topAnchor.constraint(equalTo: recommendationsHeader.bottomAnchor, constant: 10),
            recommendations.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            recommendations.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            recommendations.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        recommendations.backgroundColor = .clear
        recommendations.delegate = self
        recommendations.dataSource = self
        
        
        let popularTrainingsHeader: UILabel = getHeader(text: "Most popular")
        contentView.addSubview(popularTrainingsHeader)
        NSLayoutConstraint.activate([
            popularTrainingsHeader.topAnchor.constraint(equalTo: recommendations.bottomAnchor, constant: 20),
            popularTrainingsHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            popularTrainingsHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
        
        contentView.addSubview(mostPopular)
        
        NSLayoutConstraint.activate([
            mostPopular.topAnchor.constraint(equalTo: popularTrainingsHeader.bottomAnchor, constant: 10),
            mostPopular.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            mostPopular.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            mostPopular.heightAnchor.constraint(equalToConstant: 200)
        ])
        mostPopular.backgroundColor = .orange
        
        let categoriesHeader: UILabel = getHeader(text: "Workout categories")
        contentView.addSubview(categoriesHeader)
        NSLayoutConstraint.activate([
            categoriesHeader.topAnchor.constraint(equalTo: mostPopular.bottomAnchor, constant: 20),
            categoriesHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            categoriesHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
        
        contentView.addSubview(categories)
        NSLayoutConstraint.activate([
            categories.topAnchor.constraint(equalTo: categoriesHeader.bottomAnchor, constant: 10),
            categories.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            categories.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            categories.heightAnchor.constraint(equalToConstant: 255)
        ])
        categories.backgroundColor = .yellow
        
        let popularCoachesHeader = getHeader(text: "Popular coaches")
        
        contentView.addSubview(popularCoachesHeader)
        
        NSLayoutConstraint.activate([
            popularCoachesHeader.topAnchor.constraint(equalTo: categories.bottomAnchor, constant: 20),
            popularCoachesHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            popularCoachesHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        contentView.addSubview(coaches)
        
        NSLayoutConstraint.activate([
            coaches.topAnchor.constraint(equalTo: popularCoachesHeader.bottomAnchor, constant: 10),
            coaches.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            coaches.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            coaches.heightAnchor.constraint(equalToConstant: 210),
            coaches.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        coaches.backgroundColor = .green
        
//        contentView.addSubview(coursesView)

//        coursesView.topAnchor.constraint(equalTo: trainingsHeader.bottomAnchor, constant: 10).isActive = true
//        coursesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        coursesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        coursesView.heightAnchor.constraint(equalToConstant: 300).isActive = true
//        coursesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//
        
    }
}

extension ViewController {
    func getHeader(text: String) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.font = .boldSystemFont(ofSize: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        return label
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.width - collectionView.contentInset.left - collectionView.contentInset.right, height: collectionView.height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCell.identifier, for: indexPath) as! CourseCell
        
        cell.data = data[indexPath.item]
        
        return cell
    }
}

class CourseCell: UICollectionViewCell {
    static let identifier = "CourseCell"
    
    private var theShadowLayer: CAShapeLayer?
    
    var data: Course? {
        didSet {
            title.text = data?.title
            subtitle.text = data?.subtitle
            imageView.image = UIImage(named: data!.imageName)
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
        label.font = .boldSystemFont(ofSize: 21)
        label.textColor = .white
        
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
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        contentView.addSubview(subtitle)
        
        NSLayoutConstraint.activate([
            subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            subtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            subtitle.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            title.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if self.theShadowLayer == nil {
            let rounding = CGFloat.init(22.0)

            let shadowLayer = CAShapeLayer.init()
            self.theShadowLayer = shadowLayer
            shadowLayer.path = UIBezierPath.init(roundedRect: bounds, cornerRadius: rounding).cgPath
            shadowLayer.fillColor = UIColor.clear.cgColor

            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowRadius = CGFloat.init(3.0)
            shadowLayer.shadowOpacity = Float.init(0.2)
            shadowLayer.shadowOffset = CGSize.init(width: 0.0, height: 4.0)

            self.layer.insertSublayer(shadowLayer, at: 0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
