//
//  RecommendSearchTableViewCell.swift
//  Vertical CollectionView inslide TableViewCell
//
//  Created by Chanon Latt on 3/16/22.
//

import UIKit


class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let staticData = ["I love Vanda",
                              "H",
                              "Hik Hik I love you",
                              "Jub Jub Jub Jub Jub Jub Jub Jub Jub Jub Jub Jub",
                              "Solo againnnnnnnnnnnnnnnnnnnnnn",
                              "ZZ",
                              "Hello bii",
                              "AA",
                              "BB",
                              "Z"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        if let layout = collectionView.collectionViewLayout as? AlignedCollectionViewFlowLayout {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            layout.minimumInteritemSpacing = 16
            layout.minimumLineSpacing = 8.0
            layout.horizontalAlignment = .left
        }
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        collectionView.layoutIfNeeded()
        var size = collectionView.collectionViewLayout.collectionViewContentSize
        size.height += collectionViewTopConstraint.constant
        size.height += collectionViewBottomConstraint.constant
        return size
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return staticData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.labelTitle.text = staticData[indexPath.row]
        cell.contentWidthConstraint.constant = collectionView.frame.width
        return cell
    }
    
}
