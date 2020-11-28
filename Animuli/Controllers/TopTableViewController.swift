//
//  TopTableViewController.swift
//  Animuli
//
//  Created by Анастасия Улитина on 21.11.2020.
//

import UIKit

class TopTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var fetchMore = false
    
    var offset: Int = 0
    
    var animeList = [Anime]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "Anime found"
            }
        }
    }
    
    let animeRequest = NetworkManager()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.rowHeight = 100
        requestData()
    }
    
    override func viewDidLoad() {
        //connect loading cell
        let loadingNib = UINib(nibName: "LoadingCell", bundle: nil)
        tableView.register(loadingNib, forCellReuseIdentifier: "loadingCell")
        searchBar.delegate = self
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return animeList.count
        } else if section == 1 && fetchMore {
            return 1
        }
        return 0
        // #warning Incomplete implementation, return the number of rows
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            //cell for section 0
            let cell = tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath)
            let anime = animeList[indexPath.row]
            cell.textLabel?.text = anime.attributes.titles.en_jp
            cell.detailTextLabel?.text = anime.id
    
            //load image
            let imageURL = URL(string: anime.attributes.posterImage.small)
            DispatchQueue.main.async {
                guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
                cell.imageView?.image = UIImage(data: imageData)
                //tableView.reloadData()
            }
            return cell
        } else {
            //cell for section 1
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as! LoadingCell
            cell.spinner.startAnimating()
            return cell
        }
    }
    
    //MARK: - Table view delegate method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            let animeAtributes = self.animeList[indexPath.row].attributes
            destinationVC.animeImageString = animeAtributes.posterImage.large
            destinationVC.animeTitle = animeAtributes.titles.en_jp
            destinationVC.rating = animeAtributes.averageRating
            destinationVC.status = animeAtributes.status
        }
    }
    
    // requesting data from api
    func requestData() {
        animeRequest.fetchAnimeData { [weak self] result in
            switch result {
            case .success(let anime):
                //print(anime)
                self?.animeList = anime
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: - Loading more anime mathods
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //Check if it is the end of table
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - scrollView.frame.size.height) {
            if !self.fetchMore {
                //call method that load more anime
                beginFetchMore()
            }
        }
    }
    

    func beginFetchMore() {
        
        fetchMore = true
        print("Begin fetch")
        //api paging
        offset += 20
        tableView.reloadSections(IndexSet(integer: 1), with: .none)
        animeRequest.fetchAnimeData(offset: offset) { [weak self] result in
            switch result {
            case .success(let anime):
                self?.animeList.append(contentsOf: anime)
                self?.fetchMore = false
            case .failure(let error):
                print(error)
            }
        }
        
    }
}

//MARK: - SearchBar Delegate

extension TopTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}

//MARK: - Network manager delegate



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


