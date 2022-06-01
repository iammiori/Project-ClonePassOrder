//
//  UserUnitTest.swift
//  UnitTest
//
//  Created by 정덕호 on 2022/06/01.
//

import XCTest
@testable import Project_ClonePassOrder

class UserUnitTest: XCTestCase {
    
    var sut: UserViewModel!

    override func setUpWithError() throws {
       try super.setUpWithError()
        sut = UserViewModel()
    }

    override func tearDownWithError() throws {
       try super.tearDownWithError()
        sut = nil
    }

    func test_UserViewModel() {
        //given
        let model = UserModel(userName: "정한별",
                              email: "aoao1216@naver.com",
                              profileImageUrl: "profileimageUrl")
        sut.model.value = model
        
        
        //then
        XCTAssertEqual(sut.userName, "정한별")
        XCTAssertEqual(sut.profileImageUrl, URL(string: "profileimageUrl"))
    }
    func test_userFetch를_호출했을때_성공하는경우_model전달되는지() {
        let uid = "fdg2qkdsalk234"
        let model = UserModel(userName: "정한별",
                              email: "",
                              profileImageUrl: "profileimageUrl")
        var mockUserService = MockUserService()
        mockUserService.result = .success(model)
        sut.userService = mockUserService
        
    
        
        sut.userFetch(uid: uid)
        
        XCTAssertEqual(sut.model.value.userName, model.userName)
        XCTAssertEqual(sut.model.value.profileImageUrl, model.profileImageUrl)
    }
    func test_userFetch를_호출했을때_Firestore통신에실패하는경우_userFetchError를전달하는지() {
        let uid = "fdg2qkdsalk234"
        var mockUserService = MockUserService()
        mockUserService.result = .failure(.userFetchError)
        sut.userService = mockUserService
        
    
        
        sut.userFetch(uid: uid)
        
        XCTAssertEqual(sut.userServiceError.value, .userFetchError )
    }
    func test_userFetch를_호출했을때_snapshot데이터가_없는경우_snapShotError를전달하는지() {
        let uid = "fdg2qkdsalk234"
        var mockUserService = MockUserService()
        mockUserService.result = .failure(.snapShotError)
        sut.userService = mockUserService
        
    
        
        sut.userFetch(uid: uid)
        
        XCTAssertEqual(sut.userServiceError.value, .snapShotError)
    }


}
