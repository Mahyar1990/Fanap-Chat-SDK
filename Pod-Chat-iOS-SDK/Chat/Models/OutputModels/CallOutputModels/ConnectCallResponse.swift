//
//  ConnectCallResponse.swift
//  FanapPodChatSDK
//
//  Created by MahyarZhiani on 10/15/1399 AP.
//  Copyright © 1399 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON

open class ConnectReconnectCallResponse: ResponseModel, ResponseModelDelegates {
    
    public var clientId:    String
    public var callId:      Int
    
    public init(messageContent: JSON,
                callId:         Int,
                hasError:       Bool,
                errorMessage:   String,
                errorCode:      Int) {
        
        self.clientId   = messageContent["clientId"].stringValue
        self.callId     = messageContent["callId"].intValue
        super.init(hasError: hasError, errorMessage: errorMessage, errorCode: errorCode)
    }
    
    public init(ClientDTOObject:    ClientDTO,
                callId:             Int,
                hasError:           Bool,
                errorMessage:       String,
                errorCode:          Int) {
        
        self.clientId   = ClientDTOObject.clientId!
        self.callId     = callId
        super.init(hasError: hasError, errorMessage: errorMessage, errorCode: errorCode)
    }
    
    public func returnDataAsJSON() -> JSON {
        let result: JSON = ["clientId": clientId,
                            "callId":   callId]
        
        let finalResult: JSON = ["result":          result,
                                 "hasError":        hasError,
                                 "errorMessage":    errorMessage,
                                 "errorCode":       errorCode]
        return finalResult
    }
    
}
