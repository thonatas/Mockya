//
//  ViewModel.swift
//  Mockya
//
//  Created by Thonatas Borges on 5/6/22.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func didGetData(_ data: String)
}

class ViewModel {
    // MARK: - Constants and Variables
    private var data: [String] = []
    weak var delegate: ViewModelDelegate?
    
    // MARK: - Functions
    func getData() {
        //self.animes = animeRepo.getFavoriteList()
        //self.delegate?.didGetAnimesList(animes.count == 0)
    }
}
