//
//  Project_ClonePassOrderTests.swift
//  Project-ClonePassOrderTests
//
//  Created by 정덕호 on 2022/05/30.
//

import XCTest
@testable import Project_ClonePassOrder

class AuthUnitTest: XCTestCase {
    
    var sut: AuthViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = AuthViewModel()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    func test_emailTextFieldEmptyVaild를_호출시_빈문자열을_전달했을때_email변수가_nil과_일치하는지() {
        //given
        let textFieldText = ""
        
        //when
        sut.emailTextFieldEmptyVaild(input: textFieldText)
        
        //then
        XCTAssertEqual(sut.email, nil, "이메일이 Nil이 아닙니다.")
    }
    func test_emailTextFiledEmptyVaild를_호출시_비어있지않은_문자열을_전달했을때_email변수가_문자열과_일치하는지() {
        //given
        let textFieldText = "qwer@gmail.com"
        
        //when
        sut.emailTextFieldEmptyVaild(input: textFieldText)
        
        //then
        XCTAssertEqual(sut.email, textFieldText, "이메일과 textFieldText가 일치하지않습니다.")
    }

}
