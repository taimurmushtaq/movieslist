//
//  VehicleCell.swift
//  MoviesList
//
//  Created by Taimur Mushtaq on 18/02/2019.
//  Copyright © 2019 Taimur Mushtaq. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {
    //MARK:- Properties
    static let identifier = "LocationCell"
    
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var climateLabel: UILabel!
    @IBOutlet var terrainLabel: UILabel!
    @IBOutlet var surfaceWaterLabel: UILabel!
    
    //MARK:- Cell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.addShadow(radius: 10)
    }
    
}
