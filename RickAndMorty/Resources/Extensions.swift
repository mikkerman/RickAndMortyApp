//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Михаил Герман on 19.08.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
