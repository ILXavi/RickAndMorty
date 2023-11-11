//
//  CharactersListViewController.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 9/11/23.
//

import UIKit
import Combine

class CharactersListViewController: UIViewController {
    
    //    MARK: - Outlets
    
    @IBOutlet weak var tbvAllCharacters: UITableView!
    
    //    MARK: - Properties
    private var characters: [Result]?
    private var viewModel: CharactersListViewModel?
    var cancellables: Set<AnyCancellable> = []
    
    
    //    MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        makeCalls()
        responseViewModel()
    }
    
    //    MARK: - Public Methods
    
    func set(viewModel: CharactersListViewModel) {
        self.viewModel = viewModel
    }
    
    func configView () {
        tbvAllCharacters.delegate = self
        tbvAllCharacters.dataSource = self
        tbvAllCharacters.register(UINib(nibName: CharacterTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CharacterTableViewCell.identifier)
    }
    
    func reloadCharacterTable() {
        self.tbvAllCharacters.reloadData()
    }
    
    //    MARK: - Private Methods
    
    private func makeCalls() {
        viewModel?.getAllCharactersList()
    }
    
    private func responseViewModel() {
        viewModel?.$characters.sink(receiveValue: { [weak self] characters in
            guard let self = self else { return }
            if let response = characters {
                self.characters = response
                self.reloadCharacterTable()
            }
        }).store(in: &cancellables)
    }
    
    
}

extension CharactersListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier) as? CharacterTableViewCell else{
            return UITableViewCell ()
        }
        if let character = characters?[indexPath.row] {
            print(indexPath.row)
            cell.config(character: character)
            return cell
        }
        return UITableViewCell ()
    }
}

