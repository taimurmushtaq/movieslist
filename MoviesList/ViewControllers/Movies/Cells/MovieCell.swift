//
//  MovieCell.swift
//  Taimur Mushtaq
//
//  Created by Taimur Mushtaq on 30/09/2018.
//  Copyright © 2018 Taimur Mushtaq. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    //MARK:- Properties
    static let identifier = "MovieCell"
    
    @IBOutlet var mContainerView: UIView!
    
    @IBOutlet var mTitleLabel: UILabel!
    @IBOutlet var mDescLabel: UILabel!
    @IBOutlet var mDirectorLabel: UILabel!
    @IBOutlet var mProducerLabel: UILabel!
    
    //MARK:- Cell Methods
    override func awakeFromNib() {  
        super.awakeFromNib()
        
        mContainerView.layer.addShadow(radius: 10)
    }
}
 
