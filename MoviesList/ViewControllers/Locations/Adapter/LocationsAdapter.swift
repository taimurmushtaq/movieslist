//
//  HomeAdapter.swift
//  Taimur Mushtaq
//
//  Created by Taimur Mushtaq on 07/08/2018.
//  Copyright © 2018 Taimur Mushtaq. All rights reserved.
//

import UIKit

class LocationsAdapter: NSObject {
    //MARK: - Properties
    
    var tableView: UITableView!
    var modelsArray = [LocationModel]() {
        didSet {
            tableView?.reloadData()
        }
    }
    
    //MARK: - Class methods
    private override init() { super.init() }
    
    init(withTableView tView: UITableView) {
        super.init()
        
        tableView = tView
        tableView.dataSource = self
        tableView.delegate = self
    }
}


//MARK: - UICollectionViewDataSource
extension LocationsAdapter: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.identifier) as! LocationCell
        
        setDataOnCell(cell: cell, model: modelsArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.isTracking { return }
        
        cell.contentView.alpha = 0.3
        cell.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        
        // Simple Animation
        UIView.animate(withDuration: 0.3) {
            cell.contentView.alpha = 1
            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        }
    }
}

extension LocationsAdapter {
    func setDataOnCell(cell: LocationCell, model: LocationModel) {
        cell.titleLabel.text = model.name
        cell.climateLabel.text = model.climate
        cell.terrainLabel.text = model.terrain
        cell.surfaceWaterLabel.text = model.surface_water
    }
}

//MARK: - UITableViewDelegate
extension LocationsAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}





