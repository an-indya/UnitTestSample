//
//  BookCatalogUITests.swift
//  BookCatalogUITests
//
//  Created by Anindya Sengupta on 8/6/15.
//  Copyright © 2015 Anindya Sengupta. All rights reserved.
//

import XCTest

class BookCatalogUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
        
    }
    
    func testAddBooks () {
        let app = XCUIApplication()
        let addButton = app.navigationBars["Book List"].buttons["Add"]
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        app.tables.staticTexts["1984"].tap()
    }
    
    func testDeleteBooks () {
        
        let app = XCUIApplication()
        let bookListNavigationBar = app.navigationBars["Book List"]
        let addButton = bookListNavigationBar.buttons["Add"]
        addButton.tap()
        addButton.tap()
        addButton.tap()
        bookListNavigationBar.buttons["Edit"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.buttons["Delete Slaughterhouse-Five"].tap()
        tablesQuery.buttons["Delete"].tap()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
