//
//  ArticleTableViewCell.swift
//  News App
//
//  Created by Cosmin Iulian on 09/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundColor  = Theme.background
        
        titleLabel.textColor = backgroundColor
        titleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 20)
        
        cardView.backgroundColor = Theme.accent
        cardView.layer.borderWidth = 5 // add border
        cardView.layer.borderColor = Theme.tint?.cgColor // set border color
        cardView.addShadowAndRoundedCorners()
    }
    
    
    func setup(articleModel: Article?){
        
        titleLabel.text = articleModel?.title // set the title label
    }
    
}
