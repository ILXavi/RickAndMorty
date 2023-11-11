//
//  HeaderTableViewCell.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 11/11/23.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var imgHeader: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    
    // MARK: - Properties
    
    static let identifier: String = "HeaderTableViewCellId"
    static let nibName: String = "HeaderTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Private methods
    
    private func setup() {
        selectionStyle = .none
        imgHeader.image = UIImage(named: "Rick_and_Morty")
        imgHeader.contentMode = .scaleAspectFit
        lbTitle.text = "Selecciona un personaje y verás su información"
        lbTitle.textAlignment = .center
        lbTitle.font = .rym20

    }
    
}
