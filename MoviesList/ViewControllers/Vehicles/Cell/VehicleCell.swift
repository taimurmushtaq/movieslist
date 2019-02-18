//
//  VehicleCell.swift
//  MoviesList
//
//  Created by Taimur Mushtaq on 18/02/2019.
//  Copyright © 2019 bolwala.com. All rights reserved.
//

import UIKit

class VehicleCell: UITableViewCell {
    //MARK:- Properties
    static let identifier = "VehicleCell"
    
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var lengthLabel: UILabel!
    
    //MARK:- Cell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.addShadow(radius: 10)
    }
    
}
