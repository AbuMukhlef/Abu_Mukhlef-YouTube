//
//  Model.swift
//  Abu_Mukhlef-YouTube
//
//  Created by Abu_Mukhlef on 03/06/2020.
//  Copyright © 2020 Abu_Mukhlef.You. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}


class Model {
    
    var delegate:ModelDelegate?
    
    
    func getVideos() {
        // Create a URL Object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        // Get a URLSession Object
        let session = URLSession.shared
        // Get a Data Task From URLSession Object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            // Check if there were any errors
            
            if error != nil || data == nil {
                
                return
            }
            
            do {
                // Parsing the data into viedo objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil{
                    
                    DispatchQueue.main.sync {
                    
                        // Call the "videosFetched" method of the delegate
                        self.delegate?.videosFetched(response.items!)

                    }
                    
                }
               // dump(response)
            }
            catch {
                
                
            }

        }
        
        //Kick Off The Task
        dataTask.resume()
    }
}
