//
//  HomeAdapter.swift
//  Taimur Mushtaq
//
//  Created by Taimur Mushtaq on 07/08/2018.
//  Copyright © 2018 Taimur Mushtaq. All rights reserved.
//

import UIKit

protocol MoviesDeleagte: NSObjectProtocol {
    func openDetails(forModel model: MovieModel)
}


class MoviesAdapter: NSObject {
    //MARK: - Properties
    
    weak var delegate: MoviesDeleagte?
    
    var tableView: UITableView!    
    var modelsArray = [MovieModel]() {
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
extension MoviesAdapter: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier) as! MovieCell
        
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

extension MoviesAdapter {
    func setDataOnCell(cell: MovieCell, model: MovieModel) {
        cell.titleLabel.text = "\(model.title) (\(model.release_date))"
        cell.descLabel.text = model.description
        cell.directorLabel.text = model.director
        cell.producerLabel.text = model.producer
    }
}

//MARK: - UITableViewDelegate
extension MoviesAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.openDetails(forModel: modelsArray[indexPath.row])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}





