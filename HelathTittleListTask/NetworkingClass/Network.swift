//
//  Network.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 17/11/23.
//

import Foundation
 
class NetworkWorker {
    
    private var dataTask: URLSessionDataTask?
    
    
    
    func getApiData<T:Decodable>(urlString: String,resultType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        
        let requestURLString = urlString
        guard let url = URL(string: requestURLString) else { return }
        dataTask = session.dataTask(with: url) { (data,response,error) in
            
            //Handle error
            if let error = error {
                completion(.failure(error))
                print("Data task error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else { return }
            guard let dataInString = String(data:data,encoding: String.Encoding.isoLatin1) else { return }
            guard let properData = dataInString.data(using: .utf8, allowLossyConversion: true) else { return }
            
            do {
                //print(properData)
                let jsonData = try JSONDecoder().decode(T.self, from: properData)
                //print(jsonData)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
    
    
}
