//
//  Database.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 30.11.2020.
//

import Foundation
import UIKit

class Database {
    static let shared = Database()

    var courses: [Course] = [Course(title: "Training by Helen McGregor", imageName: "1"), Course(title: "Test title", imageName: "2"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"),Course(title: "Training by Helen McGregor", imageName: "1"), Course(title: "Test title", imageName: "2"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"),Course(title: "Training by Helen McGregor", imageName: "1"), Course(title: "Test title", imageName: "2"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3"), Course(title: "Test title", imageName: "3")]

    func getAllCourses() -> [Course] {
        return courses
    }
}
