//
//  CatCell.swift
//  CatsApp
//
//  Created by angel.tejedore on 9/11/22.
//

import UIKit

class CatCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var bottomLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(name: String?, origin: String?, imageUrl: String?){
        guard let imageUrl = imageUrl,
              let origin = origin,
              let breedName = name else {return}
        cellImage.loadFrom(URLAddress: imageUrl)
        cellTitle.text = breedName
        bottomLabel.text = origin
    }
}
