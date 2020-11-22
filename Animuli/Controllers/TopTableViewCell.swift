//
//  TopTableViewCell.swift
//  Animuli
//
//  Created by Анастасия Улитина on 22.11.2020.
//

import UIKit

class TopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
