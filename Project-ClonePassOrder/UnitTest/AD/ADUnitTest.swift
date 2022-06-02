//
//  ADUnitTest.swift
//  UnitTest
//
//  Created by 정덕호 on 2022/06/02.
//

import XCTest
@testable import Project_ClonePassOrder

class ADUnitTest: XCTestCase {
    
    var sut: ADListViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ADListViewModel()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_ADViewModel() {
        //given
        let model = ADModel(ADImageUrl: "imageUrl")
        let viewModels: [FirstADViewModelItem] = [FirstADViewModelItem(model: model)]
        sut.items.value = viewModels
        //then
        XCTAssertEqual(sut.items.value[0].ADImageURL, URL(string: model.ADImageUrl))
    }
    func test_fetchFirstAD호출시_성공하는경우_items에_FirstViewModelItem배열이_담기는지() {
        //given
        let models = [ADModel(ADImageUrl: "imageUrl"),ADModel(ADImageUrl: "imageUrl2")]
        let viewMoodels = [FirstADViewModelItem(model: models[0]),FirstADViewModelItem(model: models[1])]
        var mockADService = MockADService()
        mockADService.result = .success(models)
        sut.adService = mockADService
        
        //when
        sut.fetchAD(collectionName: "firstAD")
        
        //then
        XCTAssertEqual(sut.items.value, viewMoodels)
    }
}
