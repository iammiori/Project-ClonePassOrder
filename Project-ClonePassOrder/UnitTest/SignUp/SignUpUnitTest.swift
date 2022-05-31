//
//  SignUpUnitTest.swift
//  UnitTest
//
//  Created by 정덕호 on 2022/05/31.
//

import XCTest
@testable import Project_ClonePassOrder

class SignUpUnitTest: XCTestCase {
    
    var sut: SignUpViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SignUpViewModel()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_profileImageConrvertData를_호출시_이미지가_데이터로변환되어_profileImageData변수에_담기는지() {
        //gvien
        let image = UIImage(systemName: "star")
        
        //when
        sut.profileImageConrvertData(image: image!)
        
        //then
        XCTAssertNotNil(sut.profileImageData, "profileImageData가 nil입니다")
    }
    func test_textFieldEmptyVaild를_호출시_문자열을_전달한다면_textFieldEmpty변수가_ture인지() {
        //given
        let textfieldText = "wqdkljqwkdlj"
        
        //when
        sut.textFieldEmptyVaild(text: textfieldText)
        
        //then
        XCTAssertEqual(sut.textFieldEmpty.value, true, "textFieldEmpty.value값이 true가아닙니다")
    }
    func test_textFieldEmptyVaild를_호출시_빈문자열을_전달한다면_textFieldEmpty변수가_false인지() {
        //given
        let textfieldText = ""
        
        //when
        sut.textFieldEmptyVaild(text: textfieldText)
        
        //then
        XCTAssertEqual(sut.textFieldEmpty.value, false, "textFieldEmpty.value값이 false가아닙니다")
    }
    func test_textFieldEmptyString를_호출시_textfieldEmptyValue값이_false인경우_입력해주세요를_리턴하는지() {
        //given
        sut.textFieldEmpty.value = false
        
        //when
        let valid = sut.textFieldEmptyString()
        
        //then
        XCTAssertEqual(valid, "입력해주세요!", "입력해주요를 리턴하지않습니다.")
    }
    func test_userName이_8글자이하인경우_true를리턴() {
        //give
        let userName = "한별이"
        
        //when
        let valid = sut.userNameToLongValid(userName: userName)
        
        //then
        XCTAssertTrue(valid, "userName이 8글자를 넘깁니다")
        XCTAssertEqual(sut.userName, userName, "userName이 담기지않았습니다")
    }
    

    

}
