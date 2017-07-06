//
//  FavoritesPresenter.swift
//  Cowflix
//
//  Created by Lucia Carozzi on 6/27/17.
//  Copyright © 2017 workshop. All rights reserved.
//

class FavoritesPresenter: FavoritePresenterProtocol {
    weak var view: FavoriteViewProtocol?
    var interactor: FavoriteInteractorInputProtocol?
    var wireFrame: FavoriteWireFrameProtocol?
    
    
    func viewDidLoad() {
        
    }
    
    func detail(with movie: MovieDataCell) {
        wireFrame?.presentDetailScreen(with: movie)
    }
}
