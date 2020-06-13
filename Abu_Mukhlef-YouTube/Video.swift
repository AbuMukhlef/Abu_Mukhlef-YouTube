//
//  Video.swift
//  Abu_Mukhlef-YouTube
//
//  Created by Abu_Mukhlef on 03/06/2020.
//  Copyright © 2020 Abu_Mukhlef.You. All rights reserved.
//

import Foundation

struct Video: Decodable {
    
    var VideoID = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    var snippet = ""
    var thumbnails = ""
    var high = ""
    var resourceId = ""
    var decoder = ""
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case VideoID = "videoId"
        
    }
    
    init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        //Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        //Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        //Parse published
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        //Parse thumbnails
        let thumbnailconatiner = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailconatiner.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //Parse Video ID
        let resourceIDContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey:
        .resourceId)
        self.VideoID = try resourceIDContainer.decode(String.self, forKey: .VideoID)
}
}
