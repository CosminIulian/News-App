//
//  Data.swift
//  News App
//
//  Created by Cosmin Iulian on 08/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import Foundation

public class FetchData {
    
    private let urlString = "https://newsapi.org/v2"
    private let API = "aa01566dcf2b45bfa42260c3b18cd229"
    
    
    // MARK: Create the string url for Top Headlines by country & category
    public func setUrlForTopHeadlines(country: CountryEnum, category: CategoryEnum) -> String {
        
        var concatUrlString = urlString + "/top-headlines"
        
        concatUrlString = concatCountry(concatUrlString, country)
        concatUrlString = concatCategory(concatUrlString, category)
        concatUrlString += "&apiKey=" + API
        
        return concatUrlString
    }
    
    // MARK: Concat urlString with country(first) parameter
    private func concatCountry(_ concatUrlString: String, _ country: CountryEnum) -> String {
        
        return concatUrlString + "?country=" + String(describing: country)
    }
    
    // MARK: Concat urlString with category(second) parameter
    private func concatCategory(_ concatUrlString: String, _ category: CategoryEnum) -> String {
        
        return concatUrlString + "&category=" + String(describing: category)
    }
    
}


