//
//  StoreService.swift
//  SampleProject
//
//  Created by aney on 2017. 12. 5..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire


protocol StoreServiceType {
  static func stores(type: StoreType, nearBy locatin: CLLocation, completion: @escaping () -> Void)
}


final class StoreService {
  
  // MARK: Constants
  
  fileprivate static let accessToken = "ydXtyZydGlvazj5POGRZG2sRxdLE08dPooRMMMH4f6eYXY9yFCygoVcYGbUvdfQmBYoWLoE_X2KWbs5mf5K8_gURgdWJlO6mS0mfecA35O0dPmNGMeK1KgkKycgmWnYx"
  
  fileprivate static let baseURL = URL(string: "https://api.yelp.com/v3/businesses/search")!
}


// MARK: - StoreServiceType

extension StoreService : StoreServiceType {
  
  static func stores(type: StoreType, nearBy location: CLLocation, completion: @escaping () -> Void) {
    let headers: HTTPHeaders = [
      "Authorization": "Bearer \(accessToken)",
    ]

    let parameters: Parameters = [
      "term": type.rawValue,
      "latitude": location.coordinate.latitude,
      "longitude": location.coordinate.longitude,
    ]
    
    Alamofire.request(baseURL, method: .get, parameters: parameters, headers: headers)
      .responseJSON { response in
        debugPrint(response)
        
        completion()
      }
  }
  
}