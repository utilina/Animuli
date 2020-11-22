//
//  MenuCollectionViewController.swift
//  Animuli
//
//  Created by Анастасия Улитина on 21.11.2020.
//

import UIKit

class MenuCollectionViewController: UICollectionViewController {
    
    private let itemPerRow: CGFloat = 2
    private let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    private let menuArray = ["quiz", "top", "ml", "fav"]

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return menuArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
        
        cell.layer.cornerRadius = cell.layer.frame.height / 10
        cell.menuImageView.image = UIImage(named: menuArray[indexPath.item])
        cell.backgroundColor = .black
    
        // Configure the cell
    
        
        return cell
    }

    // MARK: UICollectionViewDelegate



}

//MARK: - CollectionView FlowLayout methods

extension MenuCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let paddingWith = sectionInserts.left * (itemPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWith
        let widthPerItem = availableWidth / itemPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.top
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.top
    }
    
}
