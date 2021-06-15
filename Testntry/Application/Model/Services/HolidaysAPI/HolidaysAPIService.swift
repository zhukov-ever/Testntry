//
//  HolidaysAPIService.swift
//  Testntry
//
//  Created by kokozzz on 15.06.2021.
//

import Foundation

class HolidaysAPIService: HolidaysAPIServiceProtocol {
 
    let session: URLSession
    init() {
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config,
                             delegate: nil,
                             delegateQueue: OperationQueue.main)
    }
    
    func read(startDate: String,
              endDate: String,
              complition: @escaping ((Result<[String : [HolidayByDayResponseModel]], Error>) -> Void)) {
 
        var requestData: Data!
        do {
            let requestModel = HolidaysRequestModel(apiKey: Constants.apiKey,
                                                    startDate: startDate,
                                                    endDate: endDate)
            requestData = try JSONEncoder().encode(requestModel)
        } catch {
            complition(.failure(error))
            return
        }
        
        var request = URLRequest(url: Constants.apiUrl)
        request.httpMethod = "POST"
        request.httpBody = requestData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                complition(.failure(error))
                return
            }
            
            guard let data = data else {
                complition(.failure(ModelErrors.unknownError))
                return
            }
            
            var serializedResponse: HolidaysResponseModel!
            do {
                serializedResponse = try JSONDecoder().decode(HolidaysResponseModel.self,
                                                              from: data)
            } catch {
                complition(.failure(error))
                return
            }
            
            if let value = serializedResponse.holidays, serializedResponse.error == false {
                complition(.success(value))
            } else if let readableError = serializedResponse.reason, serializedResponse.error == true {
                complition(.failure(readableError))
            } else {
                complition(.failure(ModelErrors.unknownError))
            }
        }
        task.resume()
    }

}
