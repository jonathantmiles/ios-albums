//
//  Album.swift
//  Albums
//
//  Created by Jonathan T. Miles on 8/31/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation

struct Album: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case artist
        case coverArt
        case genres
        case id
        case name
        case songs
        
        enum  CoverArtURLs: String, CodingKey {
            case url
        }
        
        enum Genres: String, CodingKey {
            
        }
    }
    
    var artist: String
    var coverArt: String
    var genres: String
    var id: String
    var name: String
    
    var songs: [Song]
    
}

struct Song: Decodable {
        
        enum CodingKeys: String, CodingKey {
            case duration
            case id
            case name
            
            enum Duration: String, CodingKey {
                case duration
            }
            
            enum Name: String, CodingKey {
                case title
            }
        }
    
    var duration: String
    var id: String
    var title: String
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        var durationsContainer = try container.nestedContainer(keyedBy: CodingKeys.Duration.self, forKey: .duration)
        
        let duration = try durationsContainer.decode(String.self, forKey: .duration)
        
        let id = try container.decode(String.self, forKey: .id)
        
        var nameContainer = try container.nestedContainer(keyedBy: CodingKeys.Name.self, forKey: .name)
        
        let title = try nameContainer.decode(String.self, forKey: .title)
        
        self.duration = duration
        self.id = id
        self.title = title
    }
}
