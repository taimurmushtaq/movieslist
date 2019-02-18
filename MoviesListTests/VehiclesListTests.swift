//
//  VehiclesListTests.swift
//  VehiclesListTests
//
//  Created by Taimur Mushtaq on 18/02/2019.
//  Copyright © 2019 Taimur Mushtaq. All rights reserved.
//

import XCTest
@testable import MoviesList


class VehiclesListTests: XCTestCase {
    var controller: VehiclesController!
    
    override func setUp() {
        controller = VehiclesController(nibName: "VehiclesController", bundle: .main)
        _ = controller.view
    }

    override func tearDown() {
        controller = nil
    }

    func testTableNoOfRowsBeforeAPICall() {
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: 0), 0, "In the beggining, tableview should have no records")
    }

    func testVehicleAPI()  {
        let expect = expectation(description: "Vehicles API response")
        let successBlock:DefaultAPISuccessClosure! = { response in
            XCTAssertNotNil(response, "Should always recieved some data in response");
            expect.fulfill()
        }
        let failureBlock:DefaultAPIFailureClosure = { error in
            XCTAssertNotNil(error, "Request failed with error : \(String(describing: error.localizedDescription))")
            expect.fulfill()
        }
        
        controller.getVehicles(success: successBlock, failure: failureBlock)
        
        waitForExpectations(timeout: TimeInterval(Constants.apiRequestTimeoutInterval)){ error in
            XCTAssertNil(error, "Test timed out. \(String(describing: error?.localizedDescription))")
        }
    }
    
    func testVehiclesCount()  {
        let expect = expectation(description: "Vehicles API response")
        let successBlock:DefaultAPISuccessClosure! = { response in
            guard let response = response else { return }
            
            if let vehicles = try? JSONDecoder().decode([VehicleModel].self, from: response) {
                XCTAssertNotEqual(vehicles.count, 0, "After successfull API Hit, records should be more")
            }
            expect.fulfill()
            
        }
        let failureBlock:DefaultAPIFailureClosure = { error in
            XCTAssertNotNil(error, "Request failed with error : \(String(describing: error.localizedDescription))")
            expect.fulfill()
        }
        
        controller.getVehicles(success: successBlock, failure: failureBlock)
        
        waitForExpectations(timeout: TimeInterval(Constants.apiRequestTimeoutInterval)){ error in
            XCTAssertNil(error, "Test timed out. \(String(describing: error?.localizedDescription))")
        }
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
