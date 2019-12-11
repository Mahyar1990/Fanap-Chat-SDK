//
//  QueueOfForwardMessages+CoreDataClass.swift
//  FanapPodChatSDK
//
//  Created by Mahyar Zhiani on 11/27/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftyJSON


public class QueueOfForwardMessages: NSManagedObject {
    
    public func convertQueueOfForwardMessagesToQueueOfWaitForwardMessagesModelObject() -> QueueOfWaitForwardMessagesModel {
        
        var metaData:       JSON?
        var messageIds:     [Int]?
        var repliedTo:      Int?
        var threadId:       Int?
        
        func createVariables() {
            
            self.metaData?.retrieveJSONfromTransformableData(completion: { (returnedJSON) in
                metaData = returnedJSON
            })
            
            if let messageIds2 = self.messageIds as? [Int] {
                messageIds = messageIds2
            }
            
            if let repliedTo2 = self.repliedTo as? Int {
                repliedTo = repliedTo2
            }
            if let threadId2 = self.threadId as? Int {
                threadId = threadId2
            }
            
        }
        
        func createQueueOfWaitForwardtMessagesModel() -> QueueOfWaitForwardMessagesModel {
            let queueOfWaitForwardMessagesModel = QueueOfWaitForwardMessagesModel(messageIds:   messageIds,
                                                                                  metaData:     metaData,
                                                                                  repliedTo:    repliedTo,
                                                                                  threadId:     threadId,
                                                                                  typeCode:     self.typeCode,
                                                                                  uniqueId:     self.uniqueId)
            return queueOfWaitForwardMessagesModel
        }
        
        createVariables()
        let model = createQueueOfWaitForwardtMessagesModel()
        
        return model
    }
    
}
