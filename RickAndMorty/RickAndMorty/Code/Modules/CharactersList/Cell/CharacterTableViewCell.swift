//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 10/11/23.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgBackground: UIImageView!
    
    // MARK: - Properties
    
    static let identifier: String = "CharacterTableViewCellId"
    static let nibName: String = "CharacterTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Private methods
    
    private func setup() {
        selectionStyle = .none
        lbName.font = UIFont.rym30
        imgBackground.image = UIImage(named: "pickle")
        imgBackground.contentMode = .scaleToFill
    }
    
    // MARK: - Public methods
    
    func config(character: Result) {
        lbName.text = character.name
    }
}
