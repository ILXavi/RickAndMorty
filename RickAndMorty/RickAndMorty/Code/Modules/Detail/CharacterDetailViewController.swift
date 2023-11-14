//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 12/11/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    enum Constants {
        static let imageCornerRadius: CGFloat = 10
    }

    //    MARK: - Outlets
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var lbSpecie: UILabel!
    @IBOutlet weak var lbGender: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
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
    
    func showLoadingIndicator() {
        loadingIndicator.startAnimating()
        loadingIndicator.isHidden = false
    }
    
    func hideLoadingIndicator() {
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
    }
    
    //    MARK: - Private Methods
    
    private func configView() {
    
        showLoadingIndicator()
        let backgroundImage = UIImage(named: "space")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        if let imageURL = URL(string: character?.image ?? "") {
            hideLoadingIndicator()
            imgAvatar.load(url: imageURL)
        }
        imgAvatar.layer.cornerRadius = Constants.imageCornerRadius
        imgAvatar.contentMode = .scaleAspectFill
        
        lbName.text = character?.name
        lbName.font = UIFont.rym50
        lbName.textAlignment = .center
        
        [lbStatus, lbSpecie, lbGender].forEach {
            $0?.font = .rym30
            $0?.textAlignment = .center
        }
        
        lbStatus.text = "Status: \(character?.status ?? "")"
        
        lbSpecie.text = "Specie: \(character?.species ?? "")"
        
        lbGender.text = "Gender: \(character?.gender ?? "")"
    }
    

}
