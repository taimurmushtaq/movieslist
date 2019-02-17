//
//  MoviesController.swift
//  Taimur Mushtaq
//
//  Created by Taimur Mushtaq on 05/07/2018.
//  Copyright © 2018 Taimur Mushtaq. All rights reserved.
//

import UIKit
import SDWebImage

class MoviesController: BaseController {
    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var adapter: MoviesAdapter!
    
    var successBlock: DefaultAPISuccessClosure!
    var failureBlock: DefaultAPIFailureClosure!
    
    //MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
        
        setTableView()
        
        adapter = MoviesAdapter(withTableView: tableView)
        adapter.delegate = self
        
        loadData(showLoader: true)
    }
}


//MARK: - API Methods
extension MoviesController {
    func loadData(showLoader: Bool) {
        if showLoader { tableView.beginRefreshing() }
        
        successBlock = { response in
            self.tableView.endRefreshing()
            self.tableView.backgroundView = nil
            
            guard let response = response else { return }
            
            //Update the records
            do {
                let movies = try JSONDecoder().decode([MovieModel].self, from: response) //Decode JSON Response Data
                self.adapter.modelsArray.append(contentsOf: movies)
            } catch {
                // If there is no record, show empty message
                if self.adapter.modelsArray.isEmpty {
                    self.showEmptyTableView(message: Strings.noRecords.localized)
                }
            }
        }
        failureBlock = { error in
            self.tableView.endRefreshing()
            self.adapter.fetchMore = false
            
            // If there is no record, show empty message
            if self.adapter.modelsArray.isEmpty {
                self.showEmptyTableView(message: Strings.noRecords.localized)
            }
        }
        
        APIHandler.instance.getFilms(parameters: nil, success: successBlock, failure: failureBlock, errorPopup: true)
    }
}

//MARK: - Utility Methods
extension MoviesController: MoviesDeleagte {
    func setTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight =  150
        tableView.addRefreshControl(self, action: #selector(refreshData))
        tableView.registerCell(ofType: MovieCell.self, withReuseIdentifier: MovieCell.identifier)
    }
    
    @objc func refreshData() {
        loadData(showLoader: false)
    }
    
    func openDetails(forModel model: MovieModel) {
        let alert = UIAlertController.init(title: Strings.viewDetailsTitle.localized, message: Strings.viewDetailsMsg.localized, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: Strings.cancel.localized, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction.init(title: Strings.showDetails.localized, style: .default, handler: { (action) in
//            let controller = MovieDetailsController(nibName: String.init(describing: MovieDetailsController.self), bundle: .main)
//            controller.model = model
//            self.navigationController?.pushViewController(controller, animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showEmptyTableView(message: String) {
        Utility.instance.emptyTableViewMessage(message: message, tableView: tableView)
    }
}

