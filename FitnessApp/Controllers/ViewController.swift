//
//  ViewController.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 12.11.2020.
//

import UIKit

class ViewController: UIViewController {    
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
    
    let recommendations: UIView = {
        let collectionView = RecommendationsSlider()
        
        return collectionView
    }()
    
    let mostPopular: UIView = {
        let view = MostPopularCoursesView()
        
        return view
    }()
    
    let categories: UIView = {
        let view = CategoriesView()
        
        return view
    }()
    
    let coaches: UIView = {
        let view = FamousCoachesView()
        
        return view
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
        
        let popularTrainingsHeader: UILabel = getHeader(text: "Most popular")
        contentView.addSubview(popularTrainingsHeader)
        NSLayoutConstraint.activate([
            popularTrainingsHeader.topAnchor.constraint(equalTo: recommendations.bottomAnchor, constant: 30),
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
        
        let categoriesHeader: UILabel = getHeader(text: "Workout categories")
        contentView.addSubview(categoriesHeader)
        NSLayoutConstraint.activate([
            categoriesHeader.topAnchor.constraint(equalTo: mostPopular.bottomAnchor, constant: 30),
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
        
        let popularCoachesHeader = getHeader(text: "Popular coaches")
        
        contentView.addSubview(popularCoachesHeader)
        
        NSLayoutConstraint.activate([
            popularCoachesHeader.topAnchor.constraint(equalTo: categories.bottomAnchor, constant: 30),
            popularCoachesHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            popularCoachesHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        contentView.addSubview(coaches)
        
        NSLayoutConstraint.activate([
            coaches.topAnchor.constraint(equalTo: popularCoachesHeader.bottomAnchor, constant: 10),
            coaches.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            coaches.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            coaches.heightAnchor.constraint(equalToConstant: 210),
            coaches.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
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
