//
//  SendDeliverSeenRequest.swift
//  Chat
//
//  Created by Mahyar Zhiani on 10/1/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation

open class SendDeliverSeenRequest {
    
    public let messageId:   Int
    public let ownerId:     Int
    
    public let typeCode:    String?
    
    public init(messageId:  Int,
                ownerId:    Int,
                typeCode:   String?) {
        
        self.messageId  = messageId
        self.ownerId    = ownerId
        self.typeCode   = typeCode
    }
    
}

/// MARK: -  this class will be deprecate (use this class instead: 'DeliverSeenRequest')
open class DeliverSeenRequestModel: SendDeliverSeenRequest {
    
}
