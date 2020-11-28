//
//  NetworkModel.swift
//  Animuli
//
//  Created by Анастасия Улитина on 21.11.2020.
//

import Foundation

class NetworkManager {
    
    enum NetworkError: Error {
        case noDataAvilable
        case canNotProcessData
    }
    
    //Fetch data from api
    func fetchAnimeData(offset: Int = 0, completion: @escaping(Result<[Anime], NetworkError>) -> Void) {
        
            
            let urlString = "https://kitsu.io/api/edge/anime/?page[limit]=20&page[offset]=\(offset)"
            //print(urlString)
            
            guard let url = URL(string: urlString) else {
                fatalError("Cannot create url") }
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    return
                }
                
                guard let jsonData = data else {
                    completion(.failure(.noDataAvilable))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(AnimeData.self, from: jsonData)
                    let animeData = decodedData.data
                    //print(decodedData)
                    completion(.success(animeData))
                } catch {
                    completion(.failure(.canNotProcessData))
                }
            }
            //Start the task
            task.resume()
        
    }
    
}
