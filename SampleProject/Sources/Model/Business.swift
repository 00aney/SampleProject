//
//  Business.swift
//  SampleProject
//
//  Created by aney on 2017. 12. 5..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation
import CoreLocation


// MARK: Business

struct Business: Decodable {
  
  let id: String
  let name: String
  let rating: Float
  let reviewCount: Int
  let location: CLLocation
  let displayPhone: String
  let imageURL: String
  let isClosed: Bool
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
    case rating = "rating"
    case reviewCount = "review_count"
    case location = "coordinates"
    case displayPhone = "display_phone"
    case imageURL = "image_url"
    case isClosed = "is_closed"
  }
  
}


extension Business {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    let id = try container.decode(String.self, forKey: .id)
    let name = try container.decode(String.self, forKey: .name)
    let rating = try container.decode(Float.self, forKey: .rating)
    let reviewCount = try container.decode(Int.self, forKey: .reviewCount)
    
    let businessLocation = try container.decode(BusinessLocation.self, forKey: .location)
    let location = CLLocation(latitude: businessLocation.latitude, longitude: businessLocation.longitude)
    
    let displayPhone = try container.decode(String.self, forKey: .displayPhone)
    let imageURL = try container.decode(String.self, forKey: .imageURL)
    let isClosed = try container.decode(Bool.self, forKey: .isClosed)
    
    self.init(id: id,
              name: name,
              rating: rating,
              reviewCount: reviewCount,
              location: location,
              displayPhone: displayPhone,
              imageURL: imageURL,
              isClosed: isClosed)
  }
}


// MARK: Businesses

struct Businesses: Decodable {
  let items: [Business]
  let total: Int
  
  enum CodingKeys: String, CodingKey {
    case items = "businesses"
    case total = "total"
  }
}


// MARK: Location

struct BusinessLocation: Decodable {
  let latitude: CLLocationDegrees
  let longitude: CLLocationDegrees
  
  enum CodingKeys: String, CodingKey {
    case latitude = "latitude"
    case longitude = "longitude"
  }
}
