//
//  VehiclesController.swift
//  MoviesList
//
//  Created by Taimur Mushtaq on 18/02/2019.
//  Copyright © 2019 bolwala.com. All rights reserved.
//

import UIKit

class VehiclesController: BaseController {
    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var adapter: VehiclesAdapter!
    
    //MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackButton()
        title = Strings.Vehicles.localized
        
        setTableView()
        
        adapter = VehiclesAdapter(withTableView: tableView)
    
        loadData(showLoader: true)
    }
}


//MARK: - API Methods
extension VehiclesController {
    func loadData(showLoader: Bool) {
        if showLoader { tableView.beginRefreshing() }
        
        let successBlock:DefaultAPISuccessClosure! = { response in
            self.tableView.endRefreshing()
            self.tableView.backgroundView = nil
            
            guard let response = response else { return }
            
            //Update the records
            do {
                let movies = try JSONDecoder().decode([VehicleModel].self, from: response) //Decode JSON Response Data
                self.adapter.modelsArray.append(contentsOf: movies)
            } catch {
                // If there is no record, show empty message
                if self.adapter.modelsArray.isEmpty {
                    self.showEmptyTableView(message: Strings.noRecords.localized)
                }
            }
        }
        let failureBlock:DefaultAPIFailureClosure = { error in
            self.tableView.endRefreshing()
            
            // If there is no record, show empty message
            if self.adapter.modelsArray.isEmpty {
                self.showEmptyTableView(message: Strings.noRecords.localized)
            }
        }
        
        getVehicles(success: successBlock, failure: failureBlock)
    }
    
    func getVehicles(success:@escaping DefaultAPISuccessClosure, failure:@escaping DefaultAPIFailureClosure) {
        APIHandler.instance.getVehicles(parameters: nil, success: success, failure: failure, errorPopup: true)
        
    }
}

//MARK: - Utility Methods
extension VehiclesController {
    func setTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight =  150
        tableView.addRefreshControl(self, action: #selector(refreshData))
        tableView.registerCell(ofType: VehicleCell.self, withReuseIdentifier: VehicleCell.identifier)
    }
    
    @objc func refreshData() {
        loadData(showLoader: false)
    }
    
    func showEmptyTableView(message: String) {
        Utility.instance.emptyTableViewMessage(message: message, tableView: tableView)
    }
}
