//
//  CharacterCell.swift
//  Cafe24-Amiibo
//
//  Created by Jeff Umandap on 5/17/21.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    weak var vcDelegate: ViewControllerDelegate?
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    
    var data: Character?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func imageTapped(_ sender: UIButton) {
        if let data = self.data {
            vcDelegate?.imageViewTapped(data: data)
        }
    }
    
    @IBAction func nameTapped(_ sender: UIButton) {
        if let data = self.data {
            vcDelegate?.nameTapped(data: data)
        }
    }
    
}
