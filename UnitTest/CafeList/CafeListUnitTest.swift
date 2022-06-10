//
//  CafeUnitTest.swift
//  UnitTest
//
//  Created by 정덕호 on 2022/06/03.
//

import XCTest
import CoreLocation

class CafeListUnitTest: XCTestCase {
    
    var coordinate: CLLocation!
    var sut: CafeListViewModel!
  
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CafeListViewModel()
        coordinate = CLLocation(latitude: 127.123, longitude: 37.123)

    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        coordinate = nil
    }
    
    func test_model의_데이터가_원하는형태로_viewModelItem의_변수에_담기는지() {
        //given
        let model = CafeListModel(
            name: "test",
            storyCount: 1,
            favoriteCount: 1,
            imageURL: "testimageurl",
            lat: 127.123,
            lon: 37.123,
            orderTime: "order",
            newTime: "new"
        )
        let viewModel = CafeListViewModelItem(model: model)
        
        //then
        XCTAssertEqual(viewModel.name, "test")
        XCTAssertEqual(viewModel.storyCount, 1)
        XCTAssertEqual(viewModel.favoriteCount, 1)
        XCTAssertEqual(viewModel.orderTime, "order")
        XCTAssertEqual(viewModel.newTime, "new")
        XCTAssertEqual(viewModel.cafeImageURL, URL(string: "testimageurl"))
        XCTAssertEqual(viewModel.distance(coordinate: coordinate), 0)
        XCTAssertEqual(viewModel.distanceString(coordinate: coordinate), "0m")
    }
    func test_count_호출시_items_count가_리턴되는지() {
        //given
        let model = CafeListModel(
            name: "test",
            storyCount: 1,
            favoriteCount: 1,
            imageURL: "testimageurl",
            lat: 127.123,
            lon: 37.123,
            orderTime: "order",
            newTime: "new"
        )
        let items = [
            CafeListViewModelItem(model: model),
            CafeListViewModelItem(model: model),
            CafeListViewModelItem(model: model),
            CafeListViewModelItem(model: model)
        ]
        sut.items.value = items
        
        //when
        let valid = sut.count()
        
        //then
        XCTAssertEqual(valid, items.count)
    }
    func test_itemAthIndex_호출시_index에_일치하는_item을_리턴하는지() {
        //given
        let model = CafeListModel(
            name: "test",
            storyCount: 1,
            favoriteCount: 1,
            imageURL: "testimageurl",
            lat: 127.123,
            lon: 37.123,
            orderTime: "order",
            newTime: "new"
        )
        let model2 = CafeListModel(
            name: "test2",
            storyCount: 2,
            favoriteCount: 2,
            imageURL: "testimageurl2",
            lat: 127.123,
            lon: 37.123,
            orderTime: "order2",
            newTime: "new2"
        )
        let items = [
            CafeListViewModelItem(model: model),
            CafeListViewModelItem(model: model2),
            CafeListViewModelItem(model: model),
            CafeListViewModelItem(model: model)
        ]
        sut.items.value = items
        
        //when
        let valid = sut.itemAtIndex(1)
        
        //then
        XCTAssertEqual(valid, items[1])
    }
    func test_orderNearStore_호출시_거리가가까운_순서로_배열이_리턴되는지() {
        //given
        let model = CafeListModel(
            name: "test",
            storyCount: 1,
            favoriteCount: 1,
            imageURL: "testimageurl",
            lat: 127.123,
            lon: 37.123,
            orderTime: "order",
            newTime: "new"
        )
        let model2 = CafeListModel(
            name: "test2",
            storyCount: 2,
            favoriteCount: 2,
            imageURL: "testimageurl2",
            lat: 127.456,
            lon: 37.456,
            orderTime: "order2",
            newTime: "new2"
        )
        let items = [
            CafeListViewModelItem(model: model2),
            CafeListViewModelItem(model: model)
        ]
        sut.items.value = items
        
        //when
        let valid = sut.orderNearStore(coodinate: coordinate)
        
        //then
        XCTAssertGreaterThan(items[0].distance(coordinate: coordinate), items[1].distance(coordinate: coordinate))
        XCTAssertLessThan(valid[0].distance(coordinate: coordinate), valid[1].distance(coordinate: coordinate))
    }
    func test_orderManyStore_호출시_스토리가많은_순서로_배열이_리턴되는지() {
        //given
        let model = CafeListModel(
            name: "test",
            storyCount: 1,
            favoriteCount: 1,
            imageURL: "testimageurl",
            lat: 127.123,
            lon: 37.123,
            orderTime: "order",
            newTime: "new"
        )
        let model2 = CafeListModel(
            name: "test2",
            storyCount: 2,
            favoriteCount: 2,
            imageURL: "testimageurl2",
            lat: 127.456,
            lon: 37.456,
            orderTime: "order2",
            newTime: "new2"
        )
        let items = [
            CafeListViewModelItem(model: model),
            CafeListViewModelItem(model: model2)
        ]
        sut.items.value = items
        
        //when
        let valid = sut.orderManyStoryStore()
       
        //then
        XCTAssertLessThan(items[0].storyCount, items[1].storyCount)
        XCTAssertGreaterThan(valid[0].storyCount, valid[1].storyCount)
    }
    func test_orderManyStore_호출시_newTime이_신규매장인_배열만_리턴되는지() {
        //given
        let model = CafeListModel(
            name: "test",
            storyCount: 1,
            favoriteCount: 1,
            imageURL: "testimageurl",
            lat: 127.123,
            lon: 37.123,
            orderTime: "order",
            newTime: "신규매장"
        )
        let model2 = CafeListModel(
            name: "test2",
            storyCount: 2,
            favoriteCount: 2,
            imageURL: "testimageurl2",
            lat: 127.456,
            lon: 37.456,
            orderTime: "order2",
            newTime: "new2"
        )
        let items = [
            CafeListViewModelItem(model: model),
            CafeListViewModelItem(model: model2)
        ]
        sut.items.value = items
        
        //when
        let valid = sut.orderNewStore(coodinate: coordinate)
       
        //then
        XCTAssertEqual(valid[0], items[0])
    }
    func test_searchCafe_호출시_text가_name에_포함되는_배열만_리던하는지() {
        //given
        let model = CafeListModel(
            name: "test",
            storyCount: 1,
            favoriteCount: 1,
            imageURL: "testimageurl",
            lat: 127.123,
            lon: 37.123,
            orderTime: "order",
            newTime: "신규매장"
        )
        let model2 = CafeListModel(
            name: "카페",
            storyCount: 2,
            favoriteCount: 2,
            imageURL: "testimageurl2",
            lat: 127.456,
            lon: 37.456,
            orderTime: "order2",
            newTime: "new2"
        )
        let items = [
            CafeListViewModelItem(model: model),
            CafeListViewModelItem(model: model2)
        ]
        sut.items.value = items
        let text = "카"
        //when
        let valid = sut.searchCafe(text: text)
        
        //then
        XCTAssertEqual(valid[0], items[1])
    }
    func test_fetchCafe_호출시_성공하는경우_model이_매핑되어_viewModel로변환후_items로_전달되는지() {
        let models = [CafeListModel(
            name: "test1",
            storyCount: 1,
            favoriteCount: 1,
            imageURL: "testimageurl",
            lat: 127.123,
            lon: 37.123,
            orderTime: "order",
            newTime: "신규매장"
        ),CafeListModel(
            name: "test2",
            storyCount: 1,
            favoriteCount: 1,
            imageURL: "testimageurl",
            lat: 127.123,
            lon: 37.123,
            orderTime: "order",
            newTime: "신규매장"
        ),CafeListModel(
            name: "test3",
            storyCount: 1,
            favoriteCount: 1,
            imageURL: "testimageurl",
            lat: 127.123,
            lon: 37.123,
            orderTime: "order",
            newTime: "신규매장"
        )]
        var mockService = MockCafeListService()
        mockService.result = .success(models)
        sut.cafeSerivce = mockService
        
        //when
        sut.fetchCafe()
        
        //then
        XCTAssertEqual(sut.items.value[0].model,
                       models[0])
    }
    func test_fetchCafe_호출시_서버와_연결에_실패했을때_CafeFetchError가_cafeServiceError에_전달되는지() {
        //given
        var mockService = MockCafeListService()
        mockService.result = .failure(.CafeFetchError)
        sut.cafeSerivce = mockService
        
        //when
        sut.fetchCafe()
        
        //then
        XCTAssertEqual(sut.cafeServiceError.value, .CafeFetchError)
    }
    func test_fetchCafe_호출시_문서를_받아오는것에_실패했을때_snapShotError가_cafeServiceError에_전달되는지() {
        //given
        var mockService = MockCafeListService()
        mockService.result = .failure(.snapShotError)
        sut.cafeSerivce = mockService
        
        //when
        sut.fetchCafe()
        
        //then
        XCTAssertEqual(sut.cafeServiceError.value, .snapShotError)
    }
   

}
