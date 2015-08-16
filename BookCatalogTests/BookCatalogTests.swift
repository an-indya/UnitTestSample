//
//  BookCatalogTests.swift
//  BookCatalogTests
//
//  Created by Anindya Sengupta on 8/6/15.
//  Copyright © 2015 Anindya Sengupta. All rights reserved.
//

import XCTest
@testable import BookCatalog

class BookCatalogTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewLoad() {
        let masterVC = MasterViewController()
        masterVC.viewDidLoad()
        XCTAssert(masterVC.view != nil, "Passed")
    }
    
    func testpopulateBookModel() {
        let masterVC = MasterViewController()
        masterVC.populateBookModel()
        XCTAssert(masterVC.bookObjects.count == masterVC.books.count, "Book objects are \(masterVC.bookObjects.count) and books are \(masterVC.books.count) in number")
    }
    
    func testInsertNewObject () {
        let masterVC = MasterViewController()
        masterVC.populateBookModel()
        masterVC.insertNewObject(Books(bookName: "A", author: "B"))
        XCTAssert(masterVC.objects.count == 1, "Passed")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        let masterVC = MasterViewController()

        self.measureBlock {
            masterVC.populateBookModel()
        }
    }
    
}
