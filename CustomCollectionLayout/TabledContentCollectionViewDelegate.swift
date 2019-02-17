//
//  TabledContentCollectionViewDelegate.swift
//  CustomCollectionLayout
//
//  Created by Maksym Husar on 2/16/19.
//  Copyright © 2019 MaksymHusar. All rights reserved.
//

import Foundation

class TabledContentCollectionViewDelegate: DefaultCollectionViewDelegate {
    private var itemsPerRow: CGFloat = 3
    private var sectionInsets = UIEdgeInsets(top: 20.0, left: 12.0, bottom: 30.0, right: 4.0)
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left + sectionInsets.right
        let widthPerItem = collectionView.bounds.width - paddingSpace
        return CGSize(width: widthPerItem, height: widthPerItem * 0.5)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
