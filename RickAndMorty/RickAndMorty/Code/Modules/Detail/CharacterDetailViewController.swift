//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 12/11/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    //    MARK: - Outlets
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var lbSpecie: UILabel!
    @IBOutlet weak var lbGender: UILabel!
    
    //    MARK: - Properties
    
    private var viewModel: CharacterDetailViewModel?
    var character: Result?
    
    //    MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }

    //    MARK: - Public Methods
    
    func set(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
    }
    
    //    MARK: - Private Methods
    
    private func configView() {
    
        let backgroundImage = UIImage(named: "space")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        lbName.text = character?.name
        lbName.font = UIFont.rym50
        lbName.textAlignment = .center
        
        [lbStatus, lbSpecie, lbGender].forEach {
            $0?.font = .rym30
            $0?.textAlignment = .center
            
        }
        
        lbStatus.text = "Status: " + (character?.status ?? "")
        
        lbSpecie.text = "Specie: " + (character?.species ?? "")
        
        lbGender.text = "Gender: " + (character?.gender ?? "")
    }
    

}
