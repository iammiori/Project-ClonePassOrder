//
//  ADViewModel.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/06/02.
//

import Foundation
 
protocol ADListViewModelInput {
    func fetchAD(collectionName: String)
}

protocol ADListViewModelOutput {
    var items: Observer<[FirstADViewModelItem]> {get set}
    var ADServiceError: Observer<ADServiceError> {get set}
}

protocol ADListViewModelProtocol: ADListViewModelInput, ADListViewModelOutput {
}

final class ADListViewModel: ADListViewModelProtocol {
    
    var adService: ADServiceProtocol
    
    //MARK: - output
    
    var items: Observer<[FirstADViewModelItem]> = Observer(value: [])
    var ADServiceError: Observer<ADServiceError> = Observer(value: .snapShotError)
    
    init(service: ADServiceProtocol = ADService()) {
        self.adService = service
    }
    
}

extension ADListViewModel {
    
    //MARK: - input
    
    func fetchAD(collectionName: String) {
        adService.fetchAD(collectionName: collectionName) { [weak self] result in
            switch result {
            case .success(let models):
                let items = models.map {
                    FirstADViewModelItem(model: $0)
                }
                self!.items.value = items
            case .failure(let error):
                self!.ADServiceError.value = error
            }
        }
    }
}

struct FirstADViewModelItem: Equatable {
    var ADImageURL: URL?
}

extension FirstADViewModelItem {
    init(model: ADModel) {
        self.ADImageURL = URL(string: model.ADImageUrl)
    }
    
}

