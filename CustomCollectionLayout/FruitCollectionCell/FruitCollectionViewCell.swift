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
    
    @IBOutlet private weak var stackView: UIStackView!
    
    @IBOutlet private weak var ibImageView: UIImageView!
    @IBOutlet private weak var ibLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 4
        ibLabel.font = UIFont.systemFont(ofSize: 18)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateContentStyle()
    }
    
    func update(title: String, image: UIImage) {
        ibImageView.image = image
        ibLabel.text = title
    }
    
    private func updateContentStyle() {
        let isHorizontalStyle = bounds.width > 2 * bounds.height
        let oldAxis = stackView.axis
        let newAxis: NSLayoutConstraint.Axis = isHorizontalStyle ? .horizontal : .vertical
        guard oldAxis != newAxis else { return }

        stackView.axis = newAxis
        stackView.spacing = isHorizontalStyle ? 16 : 4
        ibLabel.textAlignment = isHorizontalStyle ? .left : .center
        let fontTransform: CGAffineTransform = isHorizontalStyle ? .identity : CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.3) {
            self.ibLabel.transform = fontTransform
            self.layoutIfNeeded()
        }
    }
}
