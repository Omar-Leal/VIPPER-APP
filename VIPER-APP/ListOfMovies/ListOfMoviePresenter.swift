
import Foundation


protocol BindingViewDelegator: AnyObject {
    func update(allMovies: [PopularMovieEntity])
}

// Refering the Interactor and then The View - Viceversa
class ListOfMoviePresenter {
    
    var viewUI: BindingViewDelegator?
    
    // MARK: Pointing or refering the interactor layer
    private let listOfMovieInteractor: ListOfMovieInteractor
    
    var models: [PopularMovieEntity] = []
    
    init(listOfMovieInteractor: ListOfMovieInteractor) {
        self.listOfMovieInteractor = listOfMovieInteractor
    }
    
    //MARK: With this method we can call the Interactor whateve we want in order to make the http call
    // Should be call from the view
    
    func onViewAppear() {
        Task {
            // MARK The interactor gives back a result, we stored in following constant
            models = await listOfMovieInteractor.getListOfMovies().results
            viewUI?.update(allMovies: models)
        }
    }
}

// The reference to the interacto and router are weak
// The reference to the View UI it's weak


