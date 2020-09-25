//
//  NetworkService.swift
//  iMusic
//
//  Created by Alex on 25.09.2020.
//  Copyright © 2020 Alex Sadunenko. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    
    func fetchTracks(searchText: String, complition: @escaping (SearchResponse?) -> ()) {
        guard let url = URL(string: "https://itunes.apple.com/search") else { return }
        let parameters = ["term": "\(searchText)", "limit": "10", "media": "music"]
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            
            if let error = dataResponse.error {
                print("Error data: \(error.localizedDescription)")
                complition(nil)
                return
            }
            
            guard let data = dataResponse.data else { return }
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                complition(objects)
                //self.tracks = objects.results
                //self.tableView.reloadData()
            } catch let jsonError {
                print("Failed to decode JSON ", jsonError)
                complition(nil)
            }
            
        }
    }
}
