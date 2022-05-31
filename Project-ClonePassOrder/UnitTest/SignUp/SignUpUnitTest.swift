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
    func test_textFieldEmptyVaild를_호출시_문자열을_전달한다면_ture를_리턴하는지() {
        //given
        let textfieldText = "wqdkljqwkdlj"
        
        //when
        let valid = sut.textFieldEmptyVaild(text: textfieldText)
        
        //then
        XCTAssertTrue(valid, "true가 아닙니다")
    }
    func test_textFieldEmptyVaild를_호출시_빈문자열을_전달한다면_textFieldEmpty변수가_false인지() {
        //given
        let textfieldText = ""
        
        //when
        let valid = sut.textFieldEmptyVaild(text: textfieldText)
        
        //then
        XCTAssertFalse(valid, "false가 아닙니다")
    }
    func test_userName이_8글자이하인경우_true를리턴하고_userName에_담기는지() {
        //give
        let userName = "한별이"
        
        //when
        let valid = sut.userNameToLongValid(userName: userName)
        
        //then
        XCTAssertTrue(valid, "userName이 8글자를 넘깁니다")
        XCTAssertEqual(sut.userName, userName, "userName이 담기지않았습니다")
    }
    func test_userName이_8글자이하인경우_false를리턴하고_userName이_빈문자열인지() {
        //given
        let userName = "한별이한별이한별이"
        
        //when
        let valid = sut.userNameToLongValid(userName: userName)
        
        //then
        XCTAssertFalse(valid, "userName이 8글자를 넘깁니다")
        XCTAssertEqual(sut.userName, "", "userName이 빈문자열이아닙니다")
    }
    func test_email이_이메일형식인경우_true리턴하고_email에_담기는지() {
        //given
        let email = "aoao1216@naver.com"
        
        //when
        let valid = sut.emailValidCheck(email: email)
        
        //then
        XCTAssertTrue(valid, "이메일 형식이 아닙니다")
        XCTAssertEqual(sut.email, email, "email에 담기지않았습니다")
    }
    func test_email이_이메일형식이아닌경우_false를리턴하고_email이_빈문자열인지() {
        //given
        let email = "gdlfknglkdfgklfkgdljfgjldfg"
        
        //when
        let vaild = sut.emailValidCheck(email: email)
        
        //then
        XCTAssertFalse(vaild, "이메일형식입니다")
        XCTAssertEqual(sut.email, "", "email이 빈문자열이 아닙니다")
    }
    func test_password가_8글자이상인경우_true를리턴하고_password에담기는지() {
        //given
        let password = "12345678"
        
        //when
        let valid = sut.passwordToShortValid(password: password)
        
        //then
        XCTAssertTrue(valid, "password가 8글자 미만입니다")
        XCTAssertEqual(sut.password, password, "password에 담기지않았습니다")
    }
    func test_password가_8글자미만인경우_false리턴하고_password가_빈문자열인지() {
        //given
        let password = "1234"
        
        //when
        let valid = sut.passwordToShortValid(password: password)
        
        //then
        XCTAssertFalse(valid, "password가 8글자 이상입니다")
        XCTAssertEqual(sut.password, "", "password가 빈문자열이 아닙니다")
    }
    func test_confirmPassword가_password와_같은경우_true를리턴하고_confirmPassword에_담기는지() {
        //given
        let confirmPassword = "12345678"
        sut.password = "12345678"
        
        //when
        let valid = sut.confirmPasswordValid(confirmPassword: confirmPassword)
        
        //then
        XCTAssertTrue(valid, "비밀번호가 일치하지않아 true를 리턴하지않습니다")
        XCTAssertEqual(sut.confirmPassword, confirmPassword, "비밀번호가 담기지않았습니다")
    }
    func test_confirmPassword가_password와_다른경우_false를리턴하고_confirmPassword가_빈문자열인지() {
        //given
        let confirmPassword = "12345678"
        sut.password = "qwertyyu"
        
        //when
        let valid = sut.confirmPasswordValid(confirmPassword: confirmPassword)
        
        //then
        XCTAssertFalse(valid, "비밀번호가 일치하여 false를 리턴하지않습니다")
        XCTAssertEqual(sut.confirmPassword, "", "비밀번호가 빈문자열이 아닙니다")
    }
    func test_필수약관을_모두동의한경우_true를리턴() {
        //given
        sut.is14YearsOld.value = true
        sut.isAgreeService.value = true
        sut.isAgreeLocationService.value = true
        sut.isAgreePrivacyInformation.value = true
        sut.isAgreePrivacyThirdPartyInformation.value = true
        
        //when
        let vaild = sut.requiredAgreedValid()
        
        //then
        XCTAssertTrue(vaild, "필수약관이 모두 동의되지않았습니다")
    }
    func test_필수약관중_하나라도동의하지않은경우_false를리턴() {
        //given
        sut.is14YearsOld.value = true
        sut.isAgreeService.value = false
        sut.isAgreeLocationService.value = true
        sut.isAgreePrivacyInformation.value = true
        sut.isAgreePrivacyThirdPartyInformation.value = true
        
        //when
        let vaild = sut.requiredAgreedValid()
        
        //then
        XCTAssertFalse(vaild, "필수약관이 모두 동의되지않았지만 false를 리턴하지않습니다")
    }
    func test_profileImageUpload호출시_이미지업로드에실패하는경우_uploadImageFaildError를_전달하는지() {
        //given
        var mockImageUploader = MockImageUploaderService()
        mockImageUploader.result = .failure(.uploadImageFaildError)
        sut.imageUploaderService = mockImageUploader
        sut.profileImageData = Data()
        
        //when
        sut.profileImageUpload()
        
        //then
        XCTAssertEqual(sut.imageUploadError.value, .uploadImageFaildError,"에러가 일치하지않습니다")
    }
    func test_profileImageUpload를호출시_이미지업로드에성공후_imageURL을_다운로드하는것에_실패한경우_downLoadImageFaildError_를전달하는지() {
        //given
        var mockImageUploader = MockImageUploaderService()
        mockImageUploader.result = .failure(.downLoadImageFaildError)
        sut.imageUploaderService = mockImageUploader
        sut.profileImageData = Data()
        
        //when
        sut.profileImageUpload()
        
        //then
        XCTAssertEqual(sut.imageUploadError.value, .downLoadImageFaildError,"에러가 일치하지않습니다")
    }
    func test_profileImageUpload를호출시_이미지업로드에성공_그리고_imageURL을_다운로드하는것에성공한후_String으로변환하는것에_실패한경우_URLError를_전달하는지() {
        //given
        var mockImageUploader = MockImageUploaderService()
        mockImageUploader.result = .failure(.URLError)
        sut.imageUploaderService = mockImageUploader
        sut.profileImageData = Data()
        
        //when
        sut.profileImageUpload()
        
        //then
        XCTAssertEqual(sut.imageUploadError.value, .URLError,"에러가 일치하지않습니다")
    }
    
    func test_profileImageUpload를호출시_이미지업로드에성공하는경우_전달된imageURL이_viewModel의imageURL로_성공적으로_전달하는지() {
        var mockImageUploader = MockImageUploaderService()
        //given
        mockImageUploader.result = .success("imageURL")
        sut.imageUploaderService = mockImageUploader
        sut.profileImageData = Data()
        
        //when
        sut.profileImageUpload()
        
        //then
        XCTAssertEqual(sut.imageURL.value, "imageURL","URL이 일치하지않습니다")
    }
    func test_SignUpUser를호출시_회원가입에실패하는경우_signUpFaildError를_전달하는지() {
        //given
        var mockSignupService = MockSignUpService()
        mockSignupService.result = .failure(.signUpFaildError)
        sut.signUpService = mockSignupService
        
        //when
        sut.signUpUser()
        
        //then
        XCTAssertEqual(sut.signUpError.value, .signUpFaildError,"에러가 일치하지않습니다.")
    }
    func test_SignUpUser를호출시_회원가입성공후_회원정보결과값이없는경우_resultNillError를_전달하는지() {
        //given
        var mockSignupService = MockSignUpService()
        mockSignupService.result = .failure(.resultNillError)
        sut.signUpService = mockSignupService
        
        //when
        sut.signUpUser()
        
        //then
        XCTAssertEqual(sut.signUpError.value, .resultNillError,"에러가 일치하지않습니다.")
    }
    
    func test_SignUpUser를호출시_회원가입에성공후_회원정보를Model로만들어_firestore에업로드하는것에실패한경우_upLoadFireStoreError를_전달하는지() {
        //given
        var mockSignupService = MockSignUpService()
        mockSignupService.result = .failure(.upLoadFireStoreError)
        sut.signUpService = mockSignupService
        
        //when
        sut.signUpUser()
        
        //then
        XCTAssertEqual(sut.signUpError.value, .upLoadFireStoreError,"에러가 일치하지않습니다.")
    }
    func test_SignUpUser를호출시_회원가입에성공후_회원정보를_firestore에업로드하는것까지_성공하는경우_signUpEnd변수가_ture인지() {
        //given
        var mockSignupService = MockSignUpService()
        mockSignupService.result = .success(())
        sut.signUpService = mockSignupService
        
        //when
        sut.signUpUser()
        
        //then
        XCTAssertTrue(sut.signUpEnd.value)
    }
    
}
