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
    var parser: Parser!
    var character = [Character]()
    override func setUp() {
        super.setUp()
        parser = Parser()
    }
    override func tearDown() {
        super.tearDown()
        parser = nil
        character = []
    }
    func is_image_valid_url() throws {
        let parsed = parser.verifyUrl(urlString: "https://www.google.com")
        XCTAssertTrue(parsed)
    }
    func is_image_downloaded() throws {
        let image = UIImageView()
        image.imageFromServerURL(urlString: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000100-00190002.png")
        XCTAssertNotNil(image.image)
    }
}
