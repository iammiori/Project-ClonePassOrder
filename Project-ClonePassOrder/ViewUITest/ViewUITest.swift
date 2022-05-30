//
//  ViewUITest.swift
//  ViewUITest
//
//  Created by 정덕호 on 2022/05/30.
//

import XCTest
@testable import Project_ClonePassOrder

class ViewUITest: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.staticTexts[" 이메일로 로그인"]/*[[".buttons[\" 이메일로 로그인\"].staticTexts[\" 이메일로 로그인\"]",".staticTexts[\" 이메일로 로그인\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons[" 이메일로 로그인"].tap()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testExample() throws {
        //given
        
        
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "아이디를 입력하지않았을때 토스트메시지"
        attachment.lifetime = .keepAlways
        add(attachment)
    }

  
}
