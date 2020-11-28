//
//  DetailViewController.swift
//  Animuli
//
//  Created by Анастасия Улитина on 28.11.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var animeName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addToFavButton: UIButton!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    var animeImageString: String = ""
    var animeTitle: String?
    var rating: String?
    var status: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Fetch image method
    
    fileprivate func fetchData() {
        let imageURL = URL(string: animeImageString)
        DispatchQueue.main.async {
            guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
            self.imageView.image = UIImage(data: imageData)
            self.animeName?.text = self.animeTitle
            self.statusLabel?.text = self.status
            self.ratingLabel?.text = self.rating
        }
    }
    
    
    @IBAction func addToFavPressed(_ sender: Any) {
        
    }
    
}
