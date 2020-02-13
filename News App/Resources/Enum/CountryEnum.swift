//
//  CountryEnum.swift
//  News App
//
//  Created by Cosmin Iulian on 08/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import Foundation

public enum CountryEnum: String, CaseIterable {
    
    case RO = "Romania"
    case AE = "United Arab Emirates"
    case AR = "Argentina"
    case AT = "Austria"
    case AU = "Australia"
    case BE = "Belgium"
    case BG = "Bulgaria"
    case BR = "Brazil"
    case CA = "Canada"
    case CH = "Switzerland"
    case CN = "China"
    case CO = "Colombia"
    case CU = "Cuba"
    case CZ = "Czechia"
    case DE = "Germany"
    case EG = "Egypt"
    case FR = "France"
    case GB = "United Kingdom"
    case GR = "Greece"
    case HK = "Hong Kong"
    case HU = "Hungary"
    case ID = "Indonesia"
    case IE = "Ireland"
    case IL = "Israel"
    case IN = "India"
    case IT = "Italy"
    case JP = "Japan"
    case KR = "South Korea"
    case LT = "Lithuania"
    case LV = "Latvia"
    case MA = "Morocco"
    case MX = "Mexico"
    case MY = "Malaysia"
    case NG = "Nigeria"
    case NL = "Netherlands"
    case NO = "Norway"
    case NZ = "New Zealand"
    case PH = "Philippines"
    case PL = "Poland"
    case PT = "Portugal"
    case RS = "Serbia"
    case RU = "Russia"
    case SA = "Saudi Arabia"
    case SE = "Sweden"
    case SG = "Singapore"
    case SI = "Slovenia"
    case SK = "Slovakia"
    case TH = "Thailand"
    case TR = "Turkey"
    case TW = "Taiwan"
    case UA = "Ukraine"
    case US = "United States"
    case VE = "Venezuela"
    case ZA = "South Africa"
    
    static var countryList: [String] {
        return CountryEnum.allCases.map { $0.rawValue }
    }
}
