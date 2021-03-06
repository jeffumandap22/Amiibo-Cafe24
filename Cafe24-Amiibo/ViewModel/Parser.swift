//
//  Parser.swift
//  Cafe24-Amiibo
//
//  Created by Jeff Umandap on 5/17/21.
//

import Foundation
import UIKit

struct Parser {
    
    func parse(completion: @escaping ([Character]) -> Void) {
        let api = URL(string: "https://www.amiiboapi.com/api/amiibo/")
        URLSession.shared.dataTask(with: api!) { data, _, error in
            
            if error != nil {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            do {
                let result = try JSONDecoder().decode(Amiibo.self, from: data!)
                print(result)
                completion(result.amiibo)
            } catch {
                
            }
            
        }.resume()
    }
    
    func verifyUrl(urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
}
