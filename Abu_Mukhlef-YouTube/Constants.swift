//
//  Constants.swift
//  Abu_Mukhlef-YouTube
//
//  Created by Abu_Mukhlef on 03/06/2020.
//  Copyright © 2020 Abu_Mukhlef.You. All rights reserved.
//

import Foundation

struct Constants {
    static var  API_KEY = ""
    static var PLAYLIST_ID = "UUwPAHWowcOWlWNxlmqIR__A"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
