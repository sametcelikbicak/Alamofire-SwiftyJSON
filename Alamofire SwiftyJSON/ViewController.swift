//
//  ViewController.swift
//  Alamofire SwiftyJSON
//
//  Created by Samet ÇELİKBIÇAK on 25.02.2018.
//  Copyright © 2018 Samet ÇELİKBIÇAK. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
    
    let baseUrl = "https://api.coinmarketcap.com/v1/ticker/?convert=TRY&limit=3"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJSONData(url: baseUrl)
    }
    
    func getJSONData(url: String) {
        
        Alamofire.request(url, method: .get).responseJSON { response in
            if response.result.isSuccess {
                let jsonData : JSON = JSON(response.result.value!)
                
                for json in jsonData.arrayValue {
                    print("\(json["name"]) : \(json["price_try"]) ₺ , \(json["price_usd"]) $")
                }
                
            } else {
                print("Error: \(String(describing: response.result.error))")
            }
        }
        
    }
    
}

