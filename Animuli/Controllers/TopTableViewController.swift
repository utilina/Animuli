//
//  TopTableViewController.swift
//  Animuli
//
//  Created by Анастасия Улитина on 21.11.2020.
//

import UIKit

class TopTableViewController: UITableViewController {
    
    
    var animeNum = [String]()
    //var animeImage = [String]()
    let networkModel = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkModel.delegate = self
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if animeNum == [] {
            return 1
        }
        return animeNum.count - 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath) as! TopTableViewCell
        let stringIndexPath = String(indexPath.row + 1)
        networkModel.fetchAnimeData(id: stringIndexPath)
        DispatchQueue.main.async {
            //print(self.animeID[0])
            print(self.animeNum)
            print(indexPath.row)
            //cell.topLabel?.text = self.animeNum[indexPath.row]
            tableView.reloadData()
        }
        return cell
    }
}

//MARK: - Network manager delegate

extension TopTableViewController: NetworkManagerDelegate {
    
    func didUpdateAnime(_ networkManeger: NetworkManager, anime: AnimeModel) {
        animeNum.append(anime.animeTitle)
        print(animeNum)
    }
    
    func didFailWithError(error: Error) {
        print("error delegate")
    }
}


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toAnimeList" {
//            let topVC = segue.destination as! TopTableViewController
//        }
//    }

//MARK: - Network Delegate methods




/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


