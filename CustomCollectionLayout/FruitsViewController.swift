//
//  FruitsViewController.swift
//  CustomCollectionLayout
//
//  Created by Maksym Husar on 2/13/19.
//  Copyright © 2019 MaksymHusar. All rights reserved.
//

import UIKit

class FruitsViewController: UICollectionViewController {

    private var datasource: [Fruit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.register(FruitCollectionViewCell.nib,
                                      forCellWithReuseIdentifier: FruitCollectionViewCell.reuseID)
        generateDatasource()
    }
    
    private func generateDatasource() {
        for index in 1...20 {
            let imageName = String(index % 5 + 1)
            let fruit = Fruit(name: String(index), icon: UIImage())
            datasource.append(fruit)
        }
        collectionView?.reloadData()
    }
}

// MARK: UICollectionViewDataSource & UICollectionViewDelegate
extension FruitsViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitCollectionViewCell.reuseID,
                                                            for: indexPath) as? FruitCollectionViewCell else {
            fatalError("Wrong cell")
        }
        let fruit = datasource[indexPath.item]
        cell.update(title: fruit.name, image: fruit.icon)
        return cell
    }
        
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.purple
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.lightGray
    }

}
