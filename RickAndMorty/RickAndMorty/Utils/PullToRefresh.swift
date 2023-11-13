//
//  PullToRefresh.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 13/11/23.
//

import UIKit

class PullToRefresh {
    
    // MARK: - Properties
    
    private let refreshControl = UIRefreshControl()
    let startRefresh: () -> Void
    
    // MARK: - Object lifecycle

    init(tableView: UITableView, refreshAction: @escaping() -> Void) {
        
        startRefresh = refreshAction
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    // MARK: - Private methods
    
    @objc private func refresh() {
        startRefresh()
    }
    
    // MARK: - Public methods
    
    func endRefresh() {
        refreshControl.endRefreshing()
    }
}
