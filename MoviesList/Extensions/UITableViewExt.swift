//
//  TableView.swift
//  SideMenuTemplate
//
//  Created by Taimur Mushtaq on 05/01/2018.
//  Copyright © 2018 Taimur Mushtaq. All rights reserved.
//

//import DGElasticPullToRefresh
import UIKit

extension UITableView {
    //Nib name and reusable identifier should be same
    func registerCell(ofType type: Any, withReuseIdentifier identifier: String) {
        let className = String(describing: type)
        self.register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func addRefreshControl(_ target: Any, action: Selector, tintColor: UIColor? = nil) {
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.clear
        
        if tintColor != nil {
            refreshControl?.tintColor = tintColor!
        }
        refreshControl?.addTarget(target, action: action, for: .valueChanged)
    }
    
    func beginRefreshing() {
        self.refreshControl?.beginRefreshing()
    }
    func endRefreshing() {
        self.refreshControl?.endRefreshing()
    }
}


