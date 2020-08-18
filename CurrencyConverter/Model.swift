//
//  Model.swift
//  ValuteConverter
//
//  Created by Максим Солнцев on 8/13/20.
//  Copyright © 2020 Максим Солнцев. All rights reserved.
//

import Foundation


struct ValuteResponse: Codable {
        
        var PreviousDate: String
        var Timestamp: String
        var Valute: Dictionary<String, Valute>
    }
        
        struct Valute: Codable {
            
            var ID: String
            var NumCode: String
            var CharCode: String
            var Nominal: Int
            var Name: String
            var Value: Double
            var Previous: Double
        }
