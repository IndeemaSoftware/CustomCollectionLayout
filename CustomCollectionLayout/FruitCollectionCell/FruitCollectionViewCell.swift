//
//  FruitCollectionViewCell.swift
//  CustomCollectionLayout
//
//  Created by Maksym Husar on 2/13/19.
//  Copyright © 2019 MaksymHusar. All rights reserved.
//

import UIKit

class FruitCollectionViewCell: UICollectionViewCell {

    static let reuseID = String(describing: FruitCollectionViewCell.self)
    static let nib = UINib(nibName: String(describing: FruitCollectionViewCell.self), bundle: nil)
    
    @IBOutlet private var ibImageView: UIImageView!
    @IBOutlet private var ibLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.lightGray
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
    }
    
    func update(title: String, image: UIImage) {
        ibImageView.image = image
        ibLabel.text = title
    }


}
