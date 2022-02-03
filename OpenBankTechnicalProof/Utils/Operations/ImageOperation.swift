//
//  ImageOperation.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 3/2/22.
//

import UIKit

// This enum contains all the possible states a photo record can be in
enum PhotoRecordState {
    case new, downloaded, filtered, failed
}

class PendingOperations {
    lazy var downloadInProgress: [IndexPath: Operation] = [:]
    lazy var downloadQueue: OperationQueue = {
        var queue = OperationQueue()
        
        queue.name = "Download queue"
        queue.maxConcurrentOperationCount = 1
        
        return queue
    }()
    
    lazy var filtrationsInProgress: [IndexPath: Operation] = [:]
    lazy var filtrationQueue: OperationQueue = {
        var queue = OperationQueue()
        
        queue.name = "Image Filtration queue"
        queue.maxConcurrentOperationCount = 1
        
        return queue
    }()
}

class ImageDownloader: Operation {
    let characterRecord: CharactersListItemViewModel
    
    init(_ characterRecord: CharactersListItemViewModel) {
        self.characterRecord = characterRecord
    }
    
    override func main() {
        if isCancelled {
            return
        }
        
        guard let url = characterRecord.url,
              let imageData = try? Data(contentsOf: url) else {
            return
        }
        
        if isCancelled {
            return
        }
        
        if !imageData.isEmpty {
            characterRecord.image = UIImage(data: imageData)
            characterRecord.state = .downloaded
        } else {
            characterRecord.state = .failed
            characterRecord.image = UIImage(named: "Failed")
        }
    }
}

