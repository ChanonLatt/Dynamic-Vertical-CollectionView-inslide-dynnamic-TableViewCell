//
//  RecommendSearchCollectionViewCell.swift
//  Vertical CollectionView inslide TableViewCell
//
//  Created by Chanon Latt on 3/16/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var contentWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 6.0
    }
}
