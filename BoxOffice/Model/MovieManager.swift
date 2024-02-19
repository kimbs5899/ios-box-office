//
//  MovieManager.swift
//  BoxOffice
//
//  Created by 강창현 on 2/13/24.
//

import Foundation

final class MovieManager {
    private var dailyBoxOfficeData: BoxOffice?
    private var movieDetailData: MovieDetail?
}

extension MovieManager {
    private func fetchBoxOfficeResultData(date: String, completion: @escaping (Result<BoxOffice, NetworkError>) -> Void) {
        let apiService = APIService()
        let urlString = MovieURL.makeDailyBoxOfficeURL(date: date)
        
        apiService.fetchData(urlString: urlString) { (result: Result<BoxOffice, NetworkError>) in
            switch result {
            case .success(let movies):
                completion(.success(movies))
                self.dailyBoxOfficeData = movies
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func fetchYesterDayBoxOfficeResultData(completion: @escaping (Result<BoxOffice, NetworkError>) -> Void) {
        let apiService = APIService()
        let urlString = MovieURL.makeYesterdayBoxOfficeURL()
        
        apiService.fetchData(urlString: urlString) { (result: Result<BoxOffice, NetworkError>) in
            switch result {
            case .success(let movies):
                completion(.success(movies))
                self.dailyBoxOfficeData = movies
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func fetchMovieInfoResultData(date: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        let apiService = APIService()
        let urlString = MovieURL.makeDailyBoxOfficeURL(date: date)
        
        apiService.fetchData(urlString: urlString) { (result: Result<MovieDetail, NetworkError>) in
            switch result {
            case .success(let movies):
                completion(.success(movies))
                self.movieDetailData = movies
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
