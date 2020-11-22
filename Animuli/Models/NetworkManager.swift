//
//  NetworkModel.swift
//  Animuli
//
//  Created by Анастасия Улитина on 21.11.2020.
//

import Foundation

protocol NetworkManagerDelegate {
    func updateTableViewCell(_ manager: NetworkManager, anime: AnimeModel)
    func didFailWithError(error: Error)
}

class NetworkManager {
    
    var delegate: NetworkManagerDelegate?
    
    
    //Fetch data from api
    func fetchAnimeData(id: String) {
        
        let urlString = "https://kitsu.io/api/edge/anime/" + id
        print(urlString)
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
                return
            }
            
            if let safeData = data {
                if let anime = self.parseJSON(safeData) {
                    self.delegate?.updateTableViewCell(self, anime: anime)
                }
            }
        }
        //Start the task
        task.resume()
        
    }
    
    func parseJSON(_ animeData: Data) -> AnimeModel? {
        //Decode recieved data
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(AnimeData.self, from: animeData)
            let id = decodedData.data.id
            let title = decodedData.data.attributes.titles.en_jp
            let image = decodedData.data.attributes.posterImage.medium
            let anime = AnimeModel(animeID: id, animeTitle: title, animeImage: image)
            print(anime.animeID, anime.animeImage, anime.animeTitle)
            return anime
        } catch {
            print("error parsing data\(error)")
            return nil
        }
    }
    
}
