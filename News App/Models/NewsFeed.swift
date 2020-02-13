//
//  NewsFeed.swift
//  News App
//
//  Created by Cosmin Iulian on 08/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import Foundation

public struct NewsFeed: Codable {
    
    var status:String = "" // can be 'ok' or 'error'
    var totalResults: Int = 0
    var articles: [Article]?
}
