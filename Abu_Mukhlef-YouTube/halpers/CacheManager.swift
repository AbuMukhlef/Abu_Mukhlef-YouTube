//
//  CacheManager.swift
//  Abu_Mukhlef-YouTube
//
//  Created by Abu_Mukhlef on 19/06/2020.
//  Copyright © 2020 Abu_Mukhlef.You. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideo(_ url:String, _ data:Data?) {
       
        // Store the image data and use the url as the key
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url:String) -> Data? {

        // Try to get the data for the specified url
        return cache[url]
    }
}
