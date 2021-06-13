//
//  ServicesTests.swift
//  TestntryTests
//
//  Created by kokozzz on 13.06.2021.
//

import XCTest
@testable import Testntry

class ServicesTests: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }
    
    func testDeserialisingRequestModel() throws {
        let response = exampleJSONwithRequest
        guard let dataResponse = response.data(using: .utf8) else {
            XCTAssert(false)
            return
        }
        do {
            let _ = try JSONDecoder().decode(HolidaysRequestModel.self,
                                             from: dataResponse)
            
        }
        catch {
            XCTAssert(false, error.localizedDescription)
        }
    }
    
    func testDeserialisingOkResponseModel() throws {
        let response = exampleJSONwithOK
        guard let dataResponse = response.data(using: .utf8) else {
            XCTAssert(false)
            return
        }
        do {
            let serializedResponse = try JSONDecoder().decode(HolidaysResponseModel.self,
                                                          from: dataResponse)
            XCTAssert(serializedResponse.error == false)
            XCTAssert(serializedResponse.holidays != nil)
        }
        catch {
            XCTAssert(false, error.localizedDescription)
        }
    }
    
    func testDeserialisingNotOkResponseModel() throws {
        let response = exampleJSONwithNotOK
        guard let dataResponse = response.data(using: .utf8) else {
            XCTAssert(false)
            return
        }
        do {
            let serializedResponse = try JSONDecoder().decode(HolidaysResponseModel.self,
                                                          from: dataResponse)
            XCTAssert(serializedResponse.error == true)
            XCTAssert(serializedResponse.reason != nil)
        }
        catch {
            XCTAssert(false, error.localizedDescription)
        }
    }
}

fileprivate let exampleJSONwithRequest = """
{
  "apiKey": "YOUR_API_KEY",
  "startDate": "2019-02-01",
  "endDate": "2019-02-28"
}
"""

fileprivate let exampleJSONwithNotOK = """
{
  "error": true,
  "reason": "invalid-dates"
}
"""

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

