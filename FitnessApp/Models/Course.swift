//
//  Course.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 13.11.2020.
//

import Foundation
import UIKit

class Course {
    var id = UUID()
    var imageName: String = ""
    var title: String = ""
    var subtitle: String = "Check this out"
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
