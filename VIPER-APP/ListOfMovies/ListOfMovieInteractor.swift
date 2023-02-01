import Foundation


 // 633cf4b282ee1f78b8552a027a89e9ea

class ListOfMovieInteractor {
    func getListOfMovies() async -> PopularMoviesAPIResponse {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.apiKey)")!
        let (data,_) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMoviesAPIResponse.self, from: data)
        
    }
}
