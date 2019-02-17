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
    
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var producerLabel: UILabel!
    
    //MARK:- Cell Methods
    override func awakeFromNib() {  
        super.awakeFromNib()
        
        containerView.layer.addShadow(radius: 10)
    }
}
 
