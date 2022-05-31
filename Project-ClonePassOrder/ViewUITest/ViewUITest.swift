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
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func test_아이디를입력하지않을때_아이디를입력해주세요라는_토스트메시지가_보이는지() {
//        XCUIApplication().buttons.element(boundBy: 0).tap()
//        XCUIApplication().buttons.element(boundBy: 1).tap()
//
//        let screenshot = app.screenshot()
//        let attachment = XCTAttachment(screenshot: screenshot)
//        attachment.name = "아이디를 입력하지않았을때 토스트메시지"
//        attachment.lifetime = .keepAlways
//        add(attachment)
    }
    func test_아이디를입력하고_비밀번호를입력하지않았을때_비빌번호를입력해주세요라는_토스트메시지가_보이는지() {
        XCUIApplication().buttons.element(boundBy: 0).tap()
        XCUIApplication().textFields.element(boundBy: 0).typeText("aoao1216@naver.com") 
        XCUIApplication().buttons[" 이메일로 로그인"].tap()
        sleep(1)
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "아이디를 입력하지않았을때 토스트메시지"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}


