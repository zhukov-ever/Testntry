//
//  HolidaysAPIService.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

class HolidaysAPIServiceExample: HolidaysAPIServiceProtocol {
    func read(startDate: String,
              endDate: String,
              complition: @escaping ((Result<[String : [HolidayByDayResponseModel]], Error>) -> Void)) {
        
        let response = exampleJSONwithOK
        guard let dataResponse = response.data(using: .utf8) else { fatalError() }
        do {
            let serializedResponse = try JSONDecoder().decode(HolidaysResponseModel.self,
                                                              from: dataResponse)
            if let value = serializedResponse.holidays, serializedResponse.error == false {
                complition(.success(value))
            } else if let readableError = serializedResponse.reason, serializedResponse.error == true {
                complition(.failure(readableError))
            } else {
                complition(.failure(ModelErrors.unknownError))
            }
        }
        catch {
            complition(.failure(error))
        }
    }
    
}

fileprivate let exampleJSONwithOK = """
{
  "error": false,
  "holidays": {
    "2019-02-02": [
      {
        "name": "Küünlapäev ehk pudrupäev",
        "type": "folk"
      }
    ],
    "2019-02-09": [
      {
        "name": "Luuvalupäev",
        "type": "folk"
      }
    ],
    "2019-02-22": [
      {
        "name": "Talvine peetripäev",
        "type": "folk"
      }
    ],
    "2019-02-24": [
      {
        "name": "Iseseisvuspäev",
        "type": "public"
      },
      {
        "name": "Talvine madisepäev",
        "type": "folk"
      }
    ]
  }
}
"""

