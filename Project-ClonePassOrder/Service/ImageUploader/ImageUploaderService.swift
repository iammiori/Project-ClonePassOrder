//
//  ImageUploaderService.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/31.
//

import Foundation
import Firebase

enum ImageUploaderError: Error {
    case uploadImageFaildError
    case downLoadImageFaildError
    case URLError
}

protocol ImageUploaderServiceProtocol {
    func uploadImage(
        fileName: String,
        imageData: Data,
        completion: @escaping (Result<String,ImageUploaderError>) -> Void
    )
}

struct ImageUploaderService: ImageUploaderServiceProtocol {
    func uploadImage(
        fileName: String,
        imageData: Data,
        completion: @escaping (Result<String, ImageUploaderError>) -> Void) {
        let filename = "\(fileName)/\(NSUUID().uuidString)"
        let ref = Storage.storage().reference(withPath: filename)
        ref.putData(imageData, metadata: nil) { metadata, error in
            if error != nil {
                completion(.failure(.uploadImageFaildError))
            } else {
                ref.downloadURL { url, error in
                    if error != nil {
                        completion(.failure(.downLoadImageFaildError))
                    } else {
                        guard let imageURL = url?.absoluteString else {
                            completion(.failure(.URLError))
                            return
                        }
                        completion(.success(imageURL))
                    }
                }
            }
        }
    }
    
  
    
    
}
