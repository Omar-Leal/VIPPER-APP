
import Foundation


protocol BindingViewDelegator: AnyObject {
    func update(allMovies: [MovieViewModel])
}

// Refering the Interactor and then The View - Viceversa
class ListOfMoviePresenter {
    
    var viewUI: BindingViewDelegator?
    
    // MARK: Pointing or refering the interactor layer
    private let listOfMovieInteractor: ListOfMovieInteractor
    
    var viewModelsResults: [MovieViewModel] = []
    private let mapper: Mapper
    
    
    init(listOfMovieInteractor: ListOfMovieInteractor, mapper: Mapper = Mapper()) {
        self.listOfMovieInteractor = listOfMovieInteractor
        self.mapper = mapper
    }
    
    //MARK: With this method we can call the Interactor whateve we want in order to make the http call
    // Should be call from the view
    
    func onViewAppear() {
        Task {
            // MARK The interactor gives back a result, we stored in following constant
            let models = await listOfMovieInteractor.getListOfMovies().results
            viewModelsResults  =  models.map(mapper.map(entity:))
            viewUI?.update(allMovies: viewModelsResults)
        }
    }
}

// The reference to the interacto and router are weak
// The reference to the View UI it's weak


