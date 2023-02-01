//
//  ListOfMovieRouter.swift
//  VIPER-APP
//
//  Created by Omar Leal on 1/28/23.
//

import UIKit


class ListOfMoviesRouter {
    func showListOfMovie(window: UIWindow?) {
        // 1. Make a Instance of the View Itself
        let view = ListOfMoviewView()
        
        // 2 Making a intance of the interactor so that pass of inyection
        let interactor = ListOfMovieInteractor()
        
        
        // 3. Making the instance of the presenter
        let presenter = ListOfMoviePresenter(listOfMovieInteractor: interactor)
        presenter.viewUI = view
        view.presenterReference = presenter
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
