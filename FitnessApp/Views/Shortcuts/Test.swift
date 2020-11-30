//
//  Test.swift
//  FitnessApp
//
//  Created by Ilya Senchukov on 29.11.2020.
//

import Foundation
import UIKit

func StickToEdges<Parent: UIView, Child: UIView>(parent: Parent, child: Child) {
    NSLayoutConstraint.activate([
        child.topAnchor.constraint(equalTo: parent.topAnchor),
        child.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
        child.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
        child.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
    ])
}
