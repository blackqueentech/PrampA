//
//  Breed.swift
//  PrampA
//
//  Created by Della Anjeh on 2/24/25.
//

import UIKit

struct Breed: Codable, Equatable, Identifiable {
  var id: String { name }
  let name: String
  let origin: String
  let description: String
  let wikipediaURL: String?
  let imageId: String?

  enum CodingKeys: String, CodingKey {
    case name
    case origin
    case description
    case wikipediaURL = "wikipedia_url"
    case imageId = "reference_image_id"
  }

  static var mock: Breed {
    Breed(
      name: "Abyssinian",
      origin: "Egypt",
      description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
      wikipediaURL: "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
      imageId: "0XYvRd7oD"
    )
  }
}
