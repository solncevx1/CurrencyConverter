//
//  Networking.swift
//  ValuteConverter
//
//  Created by Максим Солнцев on 8/13/20.
//  Copyright © 2020 Максим Солнцев. All rights reserved.
//

import Foundation


class Networking {
    
    func loadData(_ complitionHandler: @escaping ((ValuteResponse) -> Void)) {
        
        guard let url = URL(string: "http://www.cbr-xml-daily.ru/daily_json.js") else {return}
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            DispatchQueue.main.async {
                if error != nil {
                    print("error in request")
                } else {
                    if let resp = response as? HTTPURLResponse, resp.statusCode == 200 {
                        let currencyData = try? JSONDecoder().decode(ValuteResponse.self, from: data!)
                        
                        complitionHandler(currencyData!)
                    }
                }
            }
        }.resume()
        
    }
}

