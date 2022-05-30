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


}
