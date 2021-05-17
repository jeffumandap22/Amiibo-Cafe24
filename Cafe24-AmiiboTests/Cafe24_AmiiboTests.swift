//
//  Cafe24_AmiiboTests.swift
//  Cafe24-AmiiboTests
//
//  Created by Jeff Umandap on 5/17/21.
//

import XCTest
import UIKit
@testable import Cafe24_Amiibo

class Cafe24AmiiboTests: XCTestCase {
    func test() {
        var helloWorld: String?
        XCTAssertNil(helloWorld)
        helloWorld = "Hello World"
        XCTAssertEqual(helloWorld, "Hello World")
    }
    
    //func verifyUrl (urlString: String?) -> Bool {
    func verifyUrl() {
        
//        if let urlString = urlString {
//            if let url = NSURL(string: urlString) {
//                return UIApplication.shared.canOpenURL(url as URL)
//            }
//        }
//        return false
    }
}
