//
//  HealthDesVM.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 17/11/23.
//

import Foundation
 
 
 

class HealthDesViewModel {
    
    private var networkWorker = NetworkWorker()
    private var factsData = [Section]()
    private var title = ""
    
    // MARK: - Method to fetch Rows from Json Feed
    func fetchHealthDes( id : String ,  completion: @escaping JsonHealthCompletionHandler = { _ in }) {
        //!NetworkStatus.sharedInstance.hasConnectivity()
        
        if !(InternetConnectionManager.shared.isInternetAvailable())  {
            self.resetDataSource()
            completion(.NetworkError)
        }
        else {
            let titleURL = topicDetailUrl + id
            networkWorker.getApiData(urlString: titleURL, resultType: HealthtittlDesModel.self) { [weak self] (result) in
                switch result {
                case .success(let listOf) :
                    self?.factsData.removeAll()
                    if let tittle = listOf.result?.resources?.resource?.first?.sections?.section {
                        for row in tittle {
                             self?.factsData.append(row)
                            
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
    
    
     
    
     
    
    func showTittleAndDes () -> Section {
        if factsData.count > 0 {
            return factsData[0]
           
        }
        else {
            return Section(title: "", description: "", content: "")
        }
        
       
    }
}

