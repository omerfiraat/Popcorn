//
//  RequestFile.swift
//  Popcorn
//
//  Created by Ömer Firat on 26.11.2020.
//  Copyright © 2020 Omer Firat. All rights reserved.
//

import Foundation
import Alamofire

class RequestFile{
func getMovieList( successHandler: @escaping(MovieModel)->()/*Hocaya sor boş*/ ){
    AF.request("https://api.themoviedb.org/3/movie/popular?api_key=51717029ba9c52eaa30c9bc3cfa9fe21&language=en-US&page=1").responseDecodable{(response: AFDataResponse<MovieModel>) in switch(response.result){
    case.success(let movieList):
        successHandler(movieList)
        break
    case.failure(let error):
        print(error.localizedDescription)
        break
        }
        
    }
  
    
}
    func getMovieDetail(id:Int, successHandler: @escaping(MovieDetailModel) -> ()){
          AF.request("https://api.themoviedb.org/3/movie/" + String(id) + "?api_key=51717029ba9c52eaa30c9bc3cfa9fe21&language=en-US").responseDecodable {
              (response:AFDataResponse<MovieDetailModel>) in
              switch(response.result){
              case .success(let movieDetailResponse):
                  successHandler(movieDetailResponse)
                  break
              case .failure(let error):
                  print(error.localizedDescription)
                  break
              }
          }
          
      }

}
