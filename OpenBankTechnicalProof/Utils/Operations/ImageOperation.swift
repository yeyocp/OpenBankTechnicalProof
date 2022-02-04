//
//  ImageOperation.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 3/2/22.
//

import UIKit

// This enum contains all the possible states a photo record can be in
enum CharacterImageState {
    case new, downloaded, failed
}

class PendingOperations {
    lazy var downloadInProgress: [IndexPath: Operation] = [:]
    lazy var downloadQueue: OperationQueue = {
        var queue = OperationQueue()
        
        queue.name = "Download queue"
        queue.maxConcurrentOperationCount = 1
        
        return queue
    }()
}

class ImageDownloader: Operation {
    let characterImageURL: URL?
    var result: Result<Data> = .failure(APIErrorType.generalServiceError, nil)
    
    init(_ characterImageURL: URL?) {
        self.characterImageURL = characterImageURL
    }
    
    override func main() {
        if isCancelled {
            return
        }
        
        guard let url = characterImageURL, let imageData = try? Data(contentsOf: url) else {
            return
        }
        
        if isCancelled {
            return
        }
        
        if !imageData.isEmpty {
            result = .success(imageData)
        } else {
            result = .failure(APIErrorType.badRequestError, nil)
        }
    }
}

