//
//  Reponse.swift
//  Abu_Mukhlef-YouTube
//
//  Created by Abu_Mukhlef on 13/06/2020.
//  Copyright © 2020 Abu_Mukhlef.You. All rights reserved.
//

import Foundation

struct Response: Decodable {
   
    var items:[Video]?
    
    enum CodingKeys:String, CodingKey {
 
        case items
        
    }
    
    init(from decoder: Decoder) throws {
        
    let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
        
    }
    
}
