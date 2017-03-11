//
//  PokemonCellTableViewCell.swift
//  Pokemon Sighting GET & POST
//
//  Created by Sreekala Santhakumari on 3/9/17.
//  Copyright © 2017 Klas. All rights reserved.
//

import UIKit

class PokemonCellTableViewCell: UITableViewCell {

    @IBOutlet var pokemonView: UIImageView!
    
    @IBOutlet var pokemonNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
