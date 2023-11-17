//
//  HealthDesVM.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 17/11/23.
//

import Foundation
 
 //typealias JsonFeedCompletionHandler = (RequestStatus) -> Void

 

class HealthDesViewModel {
    
    private var networkWorker = NetworkWorker()
    private var factsData = [Section]()
    private var title = ""
    
    // MARK: - Method to fetch Rows from Json Feed
    func fetchHealthDes(completion: @escaping JsonFeedCompletionHandler = { _ in }) {
        //!NetworkStatus.sharedInstance.hasConnectivity()
        
        if !(InternetConnectionManager.shared.isInternetAvailable())  {
            self.resetDataSource()
            completion(.NetworkError)
        }
        else {
            networkWorker.getHealthTittleDes(urlString: url) { [weak self] (result) in
                switch result {
                case .success(let listOf) :
                    self?.factsData.removeAll()
                    if let tittle = listOf.result?.resources?.resource?.first?.sections?.section {
                        for row in tittle {
                            //   if let  row  = row {
                            self?.factsData.append(row)
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
        self.factsData.removeAll()
    }
    
    // MARK: - Get Title
    func getTitle() -> String {
        return "Health Tittle Description"
    }
    
    // MARK: - Get Number of Rows
    func numberOfRowsInSection(section: Int) -> Int {
        if factsData.count != 0 {
            return factsData.count
        }
        return 0
    }
    
    // MARK: - Set Data for Cell
    func cellForRowAt (indexPath: IndexPath) -> Section {
        return factsData[indexPath.row]
    }
    
    
}

