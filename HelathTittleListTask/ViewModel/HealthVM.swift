//
//  HealthVM.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 17/11/23.
//

import Foundation
typealias JsonHealthCompletionHandler = (RequestStatus) -> Void

enum RequestStatus{
    case NetworkError
    case Success
    case Failure
}

class HealthViewModel {
    
    private var networkWorker = NetworkWorker()
    private var tittleData = [Item]()
    private var title = ""
    
    // MARK: - Method to fetch Rows from Json Feed
    func fetchHealthTittleRows(completion: @escaping JsonHealthCompletionHandler = { _ in }) {
        //!NetworkStatus.sharedInstance.hasConnectivity()
        
        if !(InternetConnectionManager.shared.isInternetAvailable())  {
            self.resetDataSource()
            completion(.NetworkError)
        }
        else {
            networkWorker.getFactsJsonFeed(urlString: url) { [weak self] (result) in
                switch result {
                case .success(let listOf) :
                    self?.tittleData.removeAll()
                    if let tittle = listOf.result?.items?.item {
                        for row in tittle {
                            //   if let  row  = row {
                            self?.tittleData.append(row)
                            //  }
                        }
                    }
                    
                    completion(.Success)
                case .failure(let error):
                    self?.resetDataSource()
                    completion(.Failure)
                    print("Error in getting json feed",error)
                }
            }
            
        }
        
        // MARK: - Reset Datasource
    }
    func resetDataSource() {
        self.title = ""
        self.tittleData.removeAll()
    }
    
    // MARK: - Get Title
    func getTitle() -> String {
        return "Health Tittle List"
    }
    
    // MARK: - Get Number of Rows
    func numberOfRowsInSection(section: Int) -> Int {
        if tittleData.count != 0 {
            return tittleData.count
        }
        return 0
    }
    
    // MARK: - Set Data for Cell
    func cellForRowAt (indexPath: IndexPath) -> Item {
        return tittleData[indexPath.row]
    }
    
    
}

