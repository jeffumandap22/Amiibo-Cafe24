//
//  CharacterImageViewController.swift
//  Cafe24-Amiibo
//
//  Created by Jeff Umandap on 5/17/21.
//

import UIKit

class CharacterImageViewController: UIViewController {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var back: UIButton!
    var parser: Parser!

    var character: Character?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setData(data: character!)
    }

    func setData(data: Character) {
        self.character = data
        if parser.verifyUrl(urlString: data.image) {
            self.characterImage.imageFromServerURL(urlString: data.image)
        }
    }

    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
