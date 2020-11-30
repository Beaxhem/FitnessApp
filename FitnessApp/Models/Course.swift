//
//  Course.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 13.11.2020.
//

import Foundation
import UIKit

class Course: ItemData {
    var id = UUID()
    var imageName: String = ""
    var title: String = ""
    var subtitle: String = "Check this out"
    var length: Int = 12

    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
